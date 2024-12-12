// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExperienceTile extends StatefulWidget {
  final int i;
  const ExperienceTile({
    super.key,
    required this.i,
  });

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  int? hoveringIndex;
  @override
  Widget build(BuildContext context) {
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
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Flexible(
              //   flex: 1,
              //   child: Container(
              //     clipBehavior: Clip.hardEdge,
              //     decoration: const BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(8)),
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         alignment: Alignment.topCenter,
              //         image: NetworkImage(
              //             "https://images.unsplash.com/photo-1490604001847-b712b0c2f967?q=80&w=1253&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              //       ),
              //     ),
              //   ),
              // ),
              const Text(
                "2021 - Present",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white54),
              ),

              const SizedBox(width: 30),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Experience here",
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
                    const Row(
                      children: [
                        Flexible(
                          child: Text(
                            "Loosely designed in Figma and coded in Visual Studio Code by yours truly. Built with Next.js and Tailwind CSS, deployed with Vercel. All text is set in the Inter typeface.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width / 3),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runSpacing: 8,
                        spacing: 4,
                        children: [
                          for (var i = 0; i < 5; i++)
                            const Chip(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                shape: StadiumBorder(),
                                elevation: 0,
                                side: BorderSide.none,
                                label: Text(
                                  "Flutter",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.tealAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor:
                                    Color.fromARGB(113, 47, 112, 132))
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
