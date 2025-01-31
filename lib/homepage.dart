import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:purveshxdev/components/about_component.dart';
import 'package:purveshxdev/components/experience_component.dart';
import 'package:purveshxdev/components/profile_component.dart';
import 'package:purveshxdev/components/projects_component.dart';
import 'package:purveshxdev/components/resume_component.dart';
import 'package:purveshxdev/components/social_component.dart';
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
    final screenWidth = MediaQuery.sizeOf(context).width;

    //widgets
    final List<Widget> body = [
      RightSection(
        itemPositionsListener: itemPositionsListener,
        controller: itemScrollController,
      ),
      Expanded(
        child: ScrollablePositionedList.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 0).copyWith(right: 35),
          itemCount: 4,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          initialScrollIndex: 0,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const AboutComponent();
              case 1:
                return const ExperienceComponent();
              case 2:
                return const ProjectsComponent();
              case 3:
                return const MadeWithFlutterLogo();
              default:
                return const SizedBox();
            }
          },
        ),
      )
    ];

    //Scaffold
    return Scaffold(
      body: Background(
        childWidget: Center(
          child: screenWidth > 768
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: body)
              : const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileComponent(),
                      SocialComponent(),
                      AboutComponent(),
                      ExperienceComponent(),
                      ProjectsComponent(),
                      MadeWithFlutterLogo(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class MadeWithFlutterLogo extends StatelessWidget {
  const MadeWithFlutterLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      builder: (context) => const AdminLoginScreen(),
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
  }
}
