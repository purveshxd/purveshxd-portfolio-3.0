import 'package:flutter/material.dart';
import 'package:purveshxdev/widgets/experience_tile.dart';
import 'package:purveshxdev/widgets/section_heading_widget.dart';

class ExperienceComponent extends StatelessWidget {
  const ExperienceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadingWidget(
          sectionHeadingLabel: "Experience",
        ),
        Column(
          children: [
            for (var i = 0; i < 3; i++) ExperienceTile(i: i),
          ],
        ),
      ],
    );
  }
}
