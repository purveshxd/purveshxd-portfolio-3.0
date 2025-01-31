import 'package:flutter/material.dart';
import 'package:purveshxdev/style/style.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Text(
          "I build accessible, pixel-perfect digital experiences for the mobile & web.",
          style: TextStyle(color: Colors.white54, fontSize: 16),
        ),
      ],
    );
  }
}
