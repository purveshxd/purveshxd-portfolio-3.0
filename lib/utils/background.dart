import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget childWidget;
  const Background({super.key, required this.childWidget});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  ValueNotifier mousePointerLocation = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: MouseRegion(
        onHover: (event) {
          mousePointerLocation.value = event.localPosition;
        },
        child: ValueListenableBuilder(
          valueListenable: mousePointerLocation,
          builder: (BuildContext context, value, child) {
            return Stack(
              children: [
                MouseFollower(
                  position: value,
                ),
                child!,
              ],
            );
          },
          child: widget.childWidget,
        ),
      ),
    );
  }
}

class MouseFollower extends ImplicitlyAnimatedWidget {
  final Offset position;
  final Widget? child;

  const MouseFollower({
    super.key,
    required this.position,
    this.child,
  }) : super(
          curve: Curves.easeOut,
          duration: Durations.medium4,
        );

  @override
  ImplicitlyAnimatedWidgetState createState() => _MouseFollowerState();
}

class _MouseFollowerState extends AnimatedWidgetBaseState<MouseFollower> {
  final Tween<Offset> _positionTween = Tween(begin: Offset.zero);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return CustomPaint(
          size: Size(
            constrains.maxWidth,
            constrains.maxHeight,
          ),
          painter: MouseFollowerPaint(
            radius: 100,
            position: _positionTween.evaluate(animation),
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void forEachTween(
    visitor,
  ) {
    visitor(
      _positionTween,
      widget.position,
      (targetValue) => Tween(begin: targetValue),
    );
  }
}

// mouse follower custom painter
class MouseFollowerPaint extends CustomPainter {
  final double radius;
  final Offset position;

  MouseFollowerPaint({
    required this.position,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draws the blur
    canvas.drawCircle(
      position,
      radius,
      Paint()
        ..color = Colors.indigoAccent.shade700.withAlpha(255)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 250),
    );

    // Draws the border for the inner circle
    canvas.drawCircle(
      position,
      22, // Slightly larger radius for the border
      Paint()
        ..color = Colors.white24 // Border color
        ..style = PaintingStyle.stroke // Set style to stroke for the border
        ..strokeWidth = 2, // Thickness of the border
    );

    // Draw the filled circle
    // canvas.drawCircle(
    //   position,
    //   20,
    //   Paint()..color = Colors.indigo,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
