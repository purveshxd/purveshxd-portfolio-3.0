import 'package:flutter/material.dart';
import 'package:purveshxdev/style/style.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String sectionHeadingLabel;
  const SectionHeadingWidget({super.key, required this.sectionHeadingLabel});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: screenWidth > 768
          ? const EdgeInsets.only(top: 55, bottom: 10)
          : const EdgeInsets.all(15),
      // padding: const EdgeInsets.only(top: 55, bottom: 10),
      child: Text(
        sectionHeadingLabel.toUpperCase(),
        style: Style.sectionHeadingTextStyle,
      ),
    );
  }
}
