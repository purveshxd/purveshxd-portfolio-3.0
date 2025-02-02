import 'package:flutter/material.dart';
import 'package:purveshxdev/style/style.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width > 768 ? false : true;
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Purvesh Dongarwar",
          style: Style.headingTextStyle,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).width * .005),
        Text(
          "Mobile App Developer | 3D Artist",
          style: Style.subHeadingTextStyle,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).width * .01),
        Text(
          "I build accessible, pixel-perfect digital experiences for the mobile & web.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(color: Colors.white54, fontSize: 16),
        ),
      ],
    );
  }
}
