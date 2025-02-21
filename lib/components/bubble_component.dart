import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BouncingBalls extends StatefulWidget {
  const BouncingBalls({super.key});

  @override
  BouncingBallsState createState() => BouncingBallsState();
}

class Ball {
  Offset position;
  Offset velocity;
  double radius;
  bool canSplit;
  Color color;
  bool justCollided; // Add flag to track recent collisions

  Ball({
    required this.position,
    required this.velocity,
    required this.color,
    this.radius = 15,
    this.canSplit = true,
    this.justCollided = false,
  });
}

class BouncingBallsState extends State<BouncingBalls> {
  final List<Ball> balls = [];
  final Random random = Random();
  late Timer timer;
  static const double containerSize = 300;
  static const int maxBalls = 50;

  final List<Color> retroColors = [
    const Color(0xFFFF6B6B),
    const Color(0xFF4ECDC4),
    const Color(0xFFFFBE0B),
    const Color(0xFFA786DF),
    const Color(0xFF95E1D3),
    const Color(0xFFF38181),
    const Color(0xFF17C3B2),
    const Color(0xFFFCBF49),
  ];

  Color getRandomRetroColor() {
    return retroColors[random.nextInt(retroColors.length)];
  }

  @override
  void initState() {
    super.initState();
    balls.add(Ball(
      position: const Offset(containerSize / 2, containerSize / 2),
      velocity: const Offset(1.5, 2),
      color: getRandomRetroColor(),
    ));

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      updateBalls();
    });
  }

  void updateBalls() {
    setState(() {
      Ball? newBall;

      // Reset collision flags at the start of each frame
      for (var ball in balls) {
        ball.justCollided = false;
      }

      for (var ball in List.from(balls)) {
        // Update position
        ball.position += ball.velocity;

        bool collided = false;

        // Handle horizontal collisions
        if (ball.position.dx <= ball.radius ||
            ball.position.dx >= containerSize - ball.radius) {
          ball.velocity = Offset(-ball.velocity.dx, ball.velocity.dy);
          collided = true;
        }

        // Handle vertical collisions
        if (ball.position.dy <= ball.radius ||
            ball.position.dy >= containerSize - ball.radius) {
          ball.velocity = Offset(ball.velocity.dx, -ball.velocity.dy);
          collided = true;
        }

        // Create new ball only if:
        // 1. There was a collision
        // 2. The ball can split
        // 3. We haven't reached max balls
        // 4. No new ball was created this frame
        // 5. The ball hasn't just collided
        if (collided &&
            ball.canSplit &&
            balls.length < maxBalls &&
            newBall == null &&
            !ball.justCollided) {
          ball.canSplit = false;
          ball.justCollided = true;
          newBall = Ball(
            position: ball.position,
            velocity: Offset(
              random.nextDouble() * 3 - 1.5,
              random.nextDouble() * 3 - 1.5,
            ),
            color: getRandomRetroColor(),
          );
        }

        // Keep ball within bounds
        ball.position = Offset(
          ball.position.dx.clamp(ball.radius, containerSize - ball.radius),
          ball.position.dy.clamp(ball.radius, containerSize - ball.radius),
        );
      }

      // Add new ball if one was created
      if (newBall != null) {
        balls.add(newBall);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
          color: const Color(0xFF2D2D2D),
        ),
        child: CustomPaint(
          painter: BallPainter(balls),
        ),
      ),
    );
  }
}

class BallPainter extends CustomPainter {
  final List<Ball> balls;

  BallPainter(this.balls);

  @override
  void paint(Canvas canvas, Size size) {
    for (var ball in balls) {
      final paint = Paint()
        ..color = ball.color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(ball.position, ball.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
