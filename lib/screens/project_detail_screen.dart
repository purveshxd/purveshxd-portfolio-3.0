import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:purveshxdev/models/arguments_model.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:purveshxdev/providers/github_provider.dart';
import 'package:purveshxdev/style/style.dart';
import 'package:purveshxdev/utils/background.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreen extends StatelessWidget {
  // final String projectName;
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsModel;

    final project = args.data as Project;
    // List<String> columnName = [
    //   "Year",
    //   "Project",
    //   "Made at	",
    //   "Built with",
    //   "Link"
    // ];
    ValueNotifier isHovering = ValueNotifier(false);
    // const int projectListLength = 8;
    // const int noOfColumns = 5;
    return Scaffold(
      body: Background(
        childWidget: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                                    const Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.tealAccent,
                                    ),
                                    AnimatedContainer(
                                      duration: Durations.short4,
                                      width: isHovering.value ? 15 : 0,
                                    ),
                                    const Text(
                                      "Purvesh Dongarwar",
                                      style: TextStyle(
                                        color: Colors.tealAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  Text(
                    project.name,
                    style: Style.headingTextStyle,
                  ),
                  Center(
                    child: FutureBuilder(
                        future: GithubRepo()
                            .getRepos(project.githubLink.split('/').last),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return MarkdownBody(
                              imageBuilder: (uri, title, alt) {
                                return Image.network(
                                  uri.toString(),
                                  scale: 2,
                                );
                              },
                              data: snapshot.data!,
                              shrinkWrap: true,
                              onTapLink: (text, href, title) => launchUrl(
                                  Uri.parse(href!),
                                  webOnlyWindowName: "_blank"),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
