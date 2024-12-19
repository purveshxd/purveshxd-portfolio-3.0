import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:purveshxdev/models/user_model.dart';

class SocialComponent extends StatelessWidget {
  const SocialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Social> socialList = [
      Social(
          link: "www.github.com/purveshxd",
          icon: FontAwesomeIcons.github,
          name: "Github"),
      Social(
          name: "Linkedin",
          link: "www.linkedin.com/in/purveshxd",
          icon: FontAwesomeIcons.linkedin),
      Social(
          name: "Twitter/X",
          icon: FontAwesomeIcons.xTwitter,
          link: "www.twitter.com/xdpurvesh"),
      Social(
          link: "www.linktr.ee/purveshxd",
          icon: FontAwesomeIcons.link,
          name: "Other links")
    ];

    ValueNotifier isHovering = ValueNotifier(false);

    int? selectedIndex;
    return Row(
      children: [
        for (var i = 0; i < socialList.length; i++)
          Padding(
            padding: const EdgeInsets.all(18.0).copyWith(right: 0),
            child: ValueListenableBuilder(
                valueListenable: isHovering,
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      log("Tapped");
                    },
                    child: Tooltip(
                      message: socialList[i].name,
                      child: FocusableActionDetector(
                        child: Icon(
                          socialList[i].icon,
                          color: selectedIndex == i
                              ? isHovering.value
                                  ? Colors.white
                                  : Colors.grey
                              : Colors.grey,
                        ),
                        onShowHoverHighlight: (value) {
                          isHovering.value = value;
                          selectedIndex = i;
                        },
                      ),
                    ),
                  );
                }),
          )
      ],
    );
  }
}
