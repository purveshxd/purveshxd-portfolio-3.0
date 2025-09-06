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
          "Mobile App Developer",
          style: Style.subHeadingTextStyle,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).width * .01),
        Text(
          "I build accessible, pixel-perfect digital experiences for the mobile & web.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: const TextStyle(color: Colors.white54, fontSize: 16),
        ),
        // AnimatedContainer(
        //   duration: Durations.short4,
        //   padding: const EdgeInsets.all(15),
        //   curve: Curves.easeOut,
        //   margin: const EdgeInsets.all(8),
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //       // border: hoveringIndex == widget.i ?
        //       border: Border.all(
        //         color: Colors.white10,
        //         width: 2,
        //       ),
        //       // : null,
        //       borderRadius: BorderRadius.circular(12),
        //       color:
        //           // hoveringIndex == widget.i ?
        //           Colors.white10
        //       // : Colors.transparent,
        //       ),
        //   child: const HtmlWidget(
        //     '''
        //   <blockquote class="twitter-tweet" data-lang="en" data-dnt="true" data-theme="dark"><p lang="en" dir="ltr">🎉 I just finished Day 21 of the <a href="https://twitter.com/hashtag/100DaysOfSwiftUI?src=hash&amp;ref_src=twsrc%5Etfw">#100DaysOfSwiftUI</a> <a href="https://twitter.com/hashtag/SwiftUI?src=hash&amp;ref_src=twsrc%5Etfw">#SwiftUI</a> <a href="https://twitter.com/twostraws?ref_src=twsrc%5Etfw">@twostraws</a></p>&mdash; Purvesh Dongarwar (@xdpurvesh) <a href="https://twitter.com/xdpurvesh/status/1892490265748988096?ref_src=twsrc%5Etfw">February 20, 2025</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        //   ''',
        //   ),
        // ),
      ],
    );
  }
}
