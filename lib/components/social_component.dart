import 'dart:developer';

import 'package:flutter/material.dart';

class SocialComponent extends StatelessWidget {
  const SocialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier isHovering = ValueNotifier(false);
    int? selectedIndex;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          for (var i = 0; i < 5; i++)
            GestureDetector(
              onTap: () {
                log("Tapped");
              },
              child: ValueListenableBuilder(
                  valueListenable: isHovering,
                  builder: (context, value, child) {
                    return FocusableActionDetector(
                      child: Icon(
                        size: 55,
                        Icons.circle,
                        color: selectedIndex == i
                            ? value
                                ? Colors.white
                                : Colors.grey
                            : Colors.grey,
                      ),
                      onShowHoverHighlight: (value) {
                        isHovering.value = value;
                        selectedIndex = i;
                      },
                    );
                  }),
            )
        ],
      ),
    );
  }
}
