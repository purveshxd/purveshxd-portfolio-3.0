import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialComponent extends StatelessWidget {
  const SocialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<Social> socialList = [
      Social(link: "www.github.com/purveshxd", name: "Github"),
      Social(name: "Linkedin", link: "www.linkedin.com/in/purveshxd"),
      Social(name: "Twitter/X", link: "www.twitter.com/xdpurvesh"),
      Social(link: "www.linktr.ee/purveshxd", name: "Other links")
    ];

    List<IconData> iconsList = [
      FontAwesomeIcons.github,
      FontAwesomeIcons.linkedin,
      FontAwesomeIcons.xTwitter,
      FontAwesomeIcons.link,
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
                    onTap: () async {
                      final url = Uri.parse('https://${socialList[i].link}');
                      await launchUrl(url, webOnlyWindowName: '_blank');
                    },
                    child: Tooltip(
                      message: socialList[i].name,
                      child: FocusableActionDetector(
                        child: Icon(
                          iconsList[i],
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
