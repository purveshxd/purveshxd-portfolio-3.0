import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:purveshxdev/components/about_component.dart';
import 'package:purveshxdev/components/experience_component.dart';
import 'package:purveshxdev/components/projects_component.dart';
import 'package:purveshxdev/components/resume_component.dart';
import 'package:purveshxdev/screens/admin_login_screen.dart';
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
                // separatorBuilder: (context, index) => Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: const Divider(),
                // ),
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 0).copyWith(right: 35),
                itemCount: 4,
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
                    case 3:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ResumeComponent(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Made in "),
                              GestureDetector(
                                onDoubleTap: () {
                                  log("Double tapped");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminLoginScreen(),
                                      ));
                                },
                                child: const FlutterLogo(
                                  style: FlutterLogoStyle.horizontal,
                                  size: 50,
                                ),
                              ),
                              const Text(" with love ❤️"),
                            ],
                          )
                        ],
                      );
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
