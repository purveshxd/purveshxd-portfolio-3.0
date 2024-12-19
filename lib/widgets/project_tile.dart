// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:purveshxdev/models/arguments_model.dart';
import 'package:purveshxdev/models/user_model.dart';
import 'package:purveshxdev/utils/routes.dart';

class ProjectTile extends StatefulWidget {
  final int i;
  final Project project;
  const ProjectTile({
    super.key,
    required this.i,
    required this.project,
  });

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  int? hoveringIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // go to project details page

        Navigator.pushNamed(context, RouteName.PROJECT_DETAILS,
            arguments: ArgumentsModel(data: widget.project.name));
      },
      child: FocusableActionDetector(
        onShowHoverHighlight: (value) {
          setState(() {
            if (value) {
              hoveringIndex = widget.i;
            } else {
              hoveringIndex = null;
            }
          });
        },
        child: AnimatedContainer(
          duration: Durations.short4,
          padding: const EdgeInsets.all(15),
          curve: Curves.easeOut,
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            border: hoveringIndex == widget.i
                ? Border.all(
                    color: Colors.white10,
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
            color:
                hoveringIndex == widget.i ? Colors.white10 : Colors.transparent,
          ),
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(widget.project.thumbnailLink),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.project.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: hoveringIndex == widget.i
                                  ? Colors.tealAccent
                                  : Colors.white),
                        ),
                        AnimatedRotation(
                          duration: Durations.short4,
                          curve: Curves.easeOut,
                          turns: hoveringIndex == widget.i ? 0 : .5,
                          child: Icon(
                            Icons.arrow_outward_rounded,
                            color: hoveringIndex == widget.i
                                ? Colors.tealAccent
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.project.desc,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runSpacing: 8,
                        spacing: 4,
                        children: [
                          for (var i = 0; i < widget.project.tags.length; i++)
                            Chip(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                shape: const StadiumBorder(),
                                elevation: 0,
                                side: BorderSide.none,
                                label: Text(
                                  widget.project.tags[i],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.tealAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(113, 47, 112, 132))
                        ],
                      ),
                    )
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
