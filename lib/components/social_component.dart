import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialComponent extends StatelessWidget {
  const SocialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier isHovering = ValueNotifier(false);
    int? selectedIndex;

    List<IconData> iconsList = [
      FontAwesomeIcons.github,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.instagram,
      FontAwesomeIcons.link,
    ];

    return Row(
      children: [
        for (var i = 0; i < iconsList.length; i++)
          Padding(
            padding: const EdgeInsets.all(18.0).copyWith(right: 0),
            child: GestureDetector(
              onTap: () {
                log("Tapped");
              },
              child: ValueListenableBuilder(
                  valueListenable: isHovering,
                  builder: (context, value, child) {
                    return Tooltip(
                      message: "github",
                      child: FocusableActionDetector(
                        onShowFocusHighlight: (value) {},
                        child: Icon(
                          iconsList[i],
                          color: selectedIndex == i
                              ? value
                                  ? Colors.white
                                  : Colors.grey
                              : Colors.grey,
                        ),
                        onShowHoverHighlight: (value) {
                          isHovering.value = value;
                          selectedIndex = i;
                        },
                      ),
                    );
                  }),
            ),
          )
      ],
    );
  }
}
