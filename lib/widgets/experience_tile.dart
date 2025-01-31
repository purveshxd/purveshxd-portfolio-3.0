// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:purveshxdev/models/user_model.dart';

class ExperienceTile extends StatefulWidget {
  final Experience experience;
  final int i;
  const ExperienceTile({
    super.key,
    required this.i,
    required this.experience,
  });

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  int? hoveringIndex;

  @override
  Widget build(BuildContext context) {
    final description = widget.experience.desc.trim().split("_").sublist(1);
    return GestureDetector(
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
          child: Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  widget.experience.timeline,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white54),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.experience.companyName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: hoveringIndex == widget.i
                                  ? Colors.tealAccent
                                  : Colors.white),
                        ),
                        // AnimatedRotation(
                        //   duration: Durations.short4,
                        //   curve: Curves.easeOut,
                        //   turns: hoveringIndex == widget.i ? 0 : .5,
                        //   child: Icon(
                        //     Icons.arrow_outward_rounded,
                        //     color: hoveringIndex == widget.i
                        //         ? Colors.tealAccent
                        //         : Colors.white,
                        //   ),
                        // )
                      ],
                    ),
                    Text(
                      widget.experience.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white54),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                description.length,
                                (index) {
                                  return Text(
                                    '•  ${description[index].trim()}',
                                    // '✦ ${description[index].trim()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white30),
                                  );
                                },
                              )),
                        ),
                      ],
                    ),
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
