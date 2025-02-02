import 'package:flutter/material.dart';
import 'package:purveshxdev/models/arguments_model.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:purveshxdev/style/style.dart';
import 'package:purveshxdev/utils/background.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsModel;
    final projectList = args.data as List<Project>;
    List<String> columnName = [
      // "Year",
      "Project",
      "Made at	",
      "Built with",
      "Link"
    ];
    ValueNotifier isHovering = ValueNotifier(false);
    ValueNotifier<int?> isHoveringIndex = ValueNotifier<int?>(null);
    // const int projectListLength = 8;
    // const int noOfColumns = 4;
    return Scaffold(
      body: Background(
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
                  "All Projects",
                  style: Style.headingTextStyle,
                ),
                const SizedBox(height: 40),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width),
                  child: SingleChildScrollView(
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(3),
                        4: FlexColumnWidth(2),
                      },
                      children: [
                        // Header Row
                        TableRow(
                            children: List.generate(
                          columnName.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(columnName[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        )),
                        // Data Rows
                        ...List.generate(projectList.length, (rowIndex) {
                          return TableRow(
                            children:
                                List.generate(columnName.length, (cellIndex) {
                              // if (cellIndex == 0) {
                              //   return const Padding(
                              //     padding: EdgeInsets.all(8.0),
                              //     child: Text("2023"),
                              //   );
                              // }
                              if (cellIndex == 0) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    projectList[rowIndex].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (cellIndex == 1) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(projectList[rowIndex].desc),
                                );
                              } else if (cellIndex == 2) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    runSpacing: 10,
                                    spacing: 10,
                                    children: List.generate(
                                        projectList[rowIndex].techTag.length,
                                        (chipIndex) {
                                      return Chip(
                                        shape: const StadiumBorder(),
                                        elevation: 0,
                                        side: BorderSide.none,
                                        label: Text(
                                          projectList[rowIndex]
                                              .techTag[chipIndex],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.tealAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            113, 47, 112, 132),
                                      );
                                    }),
                                  ),
                                );
                              } else if (cellIndex == 3) {
                                return FocusableActionDetector(
                                  onShowHoverHighlight: (value) {
                                    if (value) {
                                      isHoveringIndex.value = rowIndex;
                                    } else {
                                      isHoveringIndex.value = null;
                                    }
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable: isHoveringIndex,
                                      builder: (context, value, child) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  projectList[rowIndex]
                                                      .githubLink,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      // fontSize: 18,
                                                      color: isHoveringIndex
                                                                  .value ==
                                                              rowIndex
                                                          ? Colors.tealAccent
                                                          : Colors.white),
                                                ),
                                              ),
                                              AnimatedRotation(
                                                duration: Durations.short4,
                                                curve: Curves.easeOut,
                                                turns: isHoveringIndex.value ==
                                                        rowIndex
                                                    ? 0
                                                    : .5,
                                                child: Icon(
                                                  Icons.arrow_outward_rounded,
                                                  color:
                                                      isHoveringIndex.value ==
                                                              rowIndex
                                                          ? Colors.tealAccent
                                                          : Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text("$cellIndex Hello this is project"),
                                );
                              }
                            }),
                          );
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
