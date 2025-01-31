import 'package:flutter/material.dart';
import 'package:purveshxdev/main.dart';
import 'package:purveshxdev/models/arguments_model.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:purveshxdev/utils/routes.dart';
import 'package:purveshxdev/widgets/project_tile.dart';

import '../widgets/section_heading_widget.dart';

class ProjectsComponent extends StatelessWidget {
  const ProjectsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    //
    List<Project> projectsList = firebaseProvider.getProjects();
    final projectLength = projectsList.length > 3 ? 3 : projectsList.length;
    ValueNotifier isHovering = ValueNotifier(false);
    //

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadingWidget(
          sectionHeadingLabel: "Projects",
        ),
        Column(
          children: [
            for (var i = 0; i < projectLength; i++)
              ProjectTile(i: i, project: projectsList[i])
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.ALL_PROJECT,
                arguments: ArgumentsModel(
                    data: projectsList.sublist(
                  4,
                )));
          },
          child: FocusableActionDetector(
            onShowHoverHighlight: (value) {
              isHovering.value = value;
            },
            child: ValueListenableBuilder(
                valueListenable: isHovering,
                builder: (context, value, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "View Full Projects",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decorationStyle: TextDecorationStyle.dotted),
                          ),
                          AnimatedContainer(
                            duration: Durations.short4,
                            width: isHovering.value ? 15 : 0,
                          ),
                          const Icon(Icons.arrow_forward_rounded)
                        ],
                      ),
                      const SizedBox(height: 4),
                      AnimatedContainer(
                        duration: Durations.short4,
                        curve: Curves.easeOutBack,
                        height: 2,
                        width: 160,
                        color: isHovering.value
                            ? Colors.tealAccent
                            : Colors.transparent,
                      )
                    ],
                  );
                }),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
