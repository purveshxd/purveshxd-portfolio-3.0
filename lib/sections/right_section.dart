import 'package:flutter/material.dart';
import 'package:purveshxdev/components/profile_component.dart';
import 'package:purveshxdev/components/social_component.dart';
import 'package:purveshxdev/style/style.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RightSection extends StatefulWidget {
  final ItemScrollController controller;
  final ItemPositionsListener itemPositionsListener;
  const RightSection(
      {super.key,
      required this.controller,
      required this.itemPositionsListener});

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  List<String> sectionList = [
    "About",
    "Experience",
    "Projects",
    "Resume",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Listen to item positions
    widget.itemPositionsListener.itemPositions.addListener(() {
      final positions = widget.itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        // Find the first visible item
        final firstVisibleItem = positions.first;
        setState(() {
          selectedIndex = firstVisibleItem.index;
        });
      }
    });

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileComponent(),
            screenWidth > 768 ? const Spacer() : const SizedBox(),
            for (var i = 0; i < sectionList.length; i++)
              screenWidth > 768
                  ? ProfileButtons(
                      index: i,
                      onTap: () {
                        setState(() {
                          selectedIndex = i;

                          widget.controller.scrollTo(
                              index: selectedIndex,
                              duration: Durations.medium3,
                              curve: Curves.easeOut);
                        });
                      },
                      selectedIndex: selectedIndex,
                      sectionName: sectionList[i],
                    )
                  : const SizedBox(),
            screenWidth > 768 ? const Spacer() : const SizedBox(),
            const SocialComponent(),
          ],
        ),
      ),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  final String sectionName;
  final int selectedIndex;
  final int index;
  final Function()? onTap;
  const ProfileButtons({
    super.key,
    required this.sectionName,
    required this.selectedIndex,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier isHovering = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: isHovering,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: FocusableActionDetector(
            onShowHoverHighlight: (value) {
              isHovering.value = value;
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    curve: Curves.easeOutBack,
                    padding: const EdgeInsets.all(10),
                    duration: Durations.medium4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: selectedIndex == index
                            ? Colors.white
                            : value
                                ? Colors.white
                                : Colors.grey),
                    width: selectedIndex == index
                        ? 80
                        : value
                            ? 80
                            : 30,
                    height: 4,
                  ),
                  AnimatedDefaultTextStyle(
                    curve: Curves.easeOutBack,
                    duration: Durations.medium4,
                    style: selectedIndex == index
                        ? Style.sectionHeadingTextStyle
                        : value
                            ? Style.sectionHeadingTextStyle
                            : Style.sectionHeadingTextStyle
                                .copyWith(color: Colors.grey),
                    child: Text(
                      "  $sectionName",
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
