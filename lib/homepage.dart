import 'package:flutter/material.dart';
import 'package:purveshxdev/components/about_component.dart';
import 'package:purveshxdev/components/experience_component.dart';
import 'package:purveshxdev/components/projects_component.dart';
import 'package:purveshxdev/sections/right_section.dart';
import 'package:purveshxdev/utils/background.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return Background(
      childWidget: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RightSection(
              itemPositionsListener: itemPositionsListener,
              controller: itemScrollController,
            ),
            Expanded(
              child: ScrollablePositionedList.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 0).copyWith(right: 35),
                itemCount: 3,
                itemPositionsListener: itemPositionsListener,
                itemScrollController: itemScrollController,
                initialScrollIndex: 0,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const AboutComponent();
                    case 1:
                      return const ProjectsComponent();
                    case 2:
                      return const ExperienceComponent();
                    default:
                      return const AboutComponent();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
