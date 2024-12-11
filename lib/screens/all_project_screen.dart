import 'package:flutter/material.dart';
import 'package:purveshxdev/style/style.dart';
import 'package:purveshxdev/utils/background.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> columnName = [
      "Year",
      "Project",
      "Made at	",
      "Built with",
      "Link"
    ];
    ValueNotifier isHovering = ValueNotifier(false);
    const int projectListLength = 8;
    const int noOfColumns = 5;
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
                "All Projects",
                style: Style.headingTextStyle,
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.sizeOf(context).width),
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
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )),
                    // Data Rows
                    ...List.generate(projectListLength, (rowIndex) {
                      return TableRow(
                        children: List.generate(noOfColumns, (cellIndex) {
                          if (cellIndex == 0) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("2023"),
                            );
                          } else if (cellIndex == 1) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Project Name"),
                            );
                          } else if (cellIndex == 2) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Company/College"),
                            );
                          } else if (cellIndex == 3) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runSpacing: 10,
                                spacing: 10,
                                children: List.generate(10, (chipIndex) {
                                  return const Chip(
                                    shape: StadiumBorder(),
                                    elevation: 0,
                                    side: BorderSide.none,
                                    label: Text(
                                      "Flutter",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.tealAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(113, 47, 112, 132),
                                  );
                                }),
                              ),
                            );
                          } else if (cellIndex == 4) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Links"),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("$cellIndex Hello this is project"),
                            );
                          }
                        }),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
