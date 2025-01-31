import 'package:flutter/material.dart';
import 'package:purveshxdev/main.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:purveshxdev/widgets/experience_tile.dart';
import 'package:purveshxdev/widgets/section_heading_widget.dart';

class ExperienceComponent extends StatelessWidget {
  const ExperienceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    //
    List<Experience> experienceList =
        firebaseProvider.getExperience().reversed.toList();
    final experienctLength =
        experienceList.length > 3 ? 3 : experienceList.length;
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadingWidget(
          sectionHeadingLabel: "Experience",
        ),
        Column(
          children: [
            for (var i = 0; i < experienctLength; i++)
              ExperienceTile(
                experience: experienceList[i],
                i: i,
              ),
          ],
        ),
      ],
    );
  }
}
