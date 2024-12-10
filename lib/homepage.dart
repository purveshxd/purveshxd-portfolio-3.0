import 'package:flutter/material.dart';
import 'package:purveshxdev/sections/right_section.dart';
import 'package:purveshxdev/utils/background.dart';

final projectKey = GlobalKey();
final aboutKey = GlobalKey();
final expKey = GlobalKey();

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      childWidget: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const RightSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(key: aboutKey, children: const [
                      Flexible(
                        child: Text(
                            "I’m a developer passionate about crafting accessible, pixel-perfect user interfaces that blend thoughtful design with robust engineering. My favorite work lies at the intersection of design and development, creating experiences that not only look great but are meticulously built for performance and usability. Currently, I'm a Senior Front-End Engineer at Klaviyo, specializing in accessibility. I contribute to the creation and maintenance of UI components that power Klaviyo’s frontend, ensuring our platform meets web accessibility standards and best practices to deliver an inclusive user experience. In the past, I've had the opportunity to develop software across a variety of settings — from advertising agencies and large corporations to start-ups and small digital product studios. Additionally, I also released a comprehensive video course a few years ago, guiding learners through building a web app with the Spotify API. In my spare time, I’m usually climbing, reading, hanging out with my wife and two cats, or running around Hyrule searching for Korok seeds Korok seeds ."),
                      ),
                    ]),
                    Text(
                      "Experience",
                      key: expKey,
                    ),
                    Column(
                      children: [
                        for (var i = 0; i <= 6; i++)
                          Container(
                            margin: EdgeInsets.all(8),
                            color: Colors.white,
                            width: double.infinity,
                            height: 200,
                          )
                      ],
                    ),
                    Text(
                      "Projects",
                      key: projectKey,
                    ),
                    Column(
                      children: [
                        for (var i = 0; i <= 6; i++)
                          Container(
                            margin: EdgeInsets.all(8),
                            color: Colors.white,
                            width: double.infinity,
                            height: 200,
                          )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
