import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purveshxdev/widgets/section_heading_widget.dart';

class AboutComponent extends StatelessWidget {
  const AboutComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadingWidget(sectionHeadingLabel: "About"),
        Row(
          children: [
            Flexible(
                child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white60,
                ),
                children: [
                  const TextSpan(
                    text:
                        '''I’m a Flutter Developer passionate about crafting pixel-perfect, accessible user interfaces that blend design with robust engineering. I specialize in mobile app development, UI/UX design, and state management, with experience building custom Android launchers, habit-tracking apps, and AI-powered projects like an EEG-based depression detection system. 
Currently, I’m expanding my expertise in iOS Development (SwiftUI), while working with startups and contract-based projects. Outside of coding, I enjoy 3D design (Blender3D), hitting the gym, and experimenting with new tech. ''',
                  ),
                  TextSpan(
                    text: '🚀',
                    style: GoogleFonts.notoColorEmoji(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
        // Divider(
        //   color: Colors.white10,
        //   thickness: 2,
        // ),
      ],
    );
  }
}
