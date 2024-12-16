import 'package:flutter/material.dart';
import 'package:purveshxdev/models/arguments_model.dart';
import 'package:purveshxdev/style/style.dart';
import 'package:purveshxdev/utils/background.dart';

class ProjectDetailScreen extends StatelessWidget {
  // final String projectName;
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsModel;

    final projectName = args.data as String;
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
    return Background(
      childWidget: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Center(
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
              const SizedBox(height: 10),
              Text(
                projectName,
                style: Style.headingTextStyle,
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width),
                  child: const Center(
                    child: Text("Project Details coming soon..."),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
