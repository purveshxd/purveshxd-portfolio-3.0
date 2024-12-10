import 'package:flutter/material.dart';
import 'package:purveshxdev/components/social_component.dart';
import 'package:purveshxdev/homepage.dart';

class RightSection extends StatefulWidget {
  const RightSection({super.key});

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  List<String> sectionList = [
    "About",
    "Experience",
    "Projects",
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Purvesh dongarwar"),
          const Text("Mobile app developer"),
          const Text(
              "I build accessible, pixel-perfect digital experiences for the web."),
          for (var i = 0; i < 3; i++)
            ProfileButtons(
              index: i,
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });

                if (selectedIndex == 0) {
                  Scrollable.ensureVisible(aboutKey.currentContext!,
                      duration: Durations.medium3, curve: Curves.easeOut);
                } else if (selectedIndex == 1) {
                  Scrollable.ensureVisible(expKey.currentContext!,
                      duration: Durations.medium3, curve: Curves.easeOut);
                } else if (selectedIndex == 2) {
                  Scrollable.ensureVisible(projectKey.currentContext!,
                      duration: Durations.medium3, curve: Curves.easeOut);
                }
              },
              selectedIndex: selectedIndex,
              sectionName: sectionList[i],
            ),
          const SocialComponent()
        ],
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
            child: Row(
              children: [
                AnimatedContainer(
                  padding: const EdgeInsets.all(10),
                  duration: Durations.short4,
                  decoration: BoxDecoration(
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
                  height: 3,
                ),
                AnimatedDefaultTextStyle(
                  duration: Durations.short4,
                  style: TextStyle(
                      color: selectedIndex == index
                          ? Colors.white
                          : value
                              ? Colors.white
                              : Colors.grey),
                  child: Text(sectionName),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
