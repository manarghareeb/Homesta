import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../core/routing/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _dotController;

  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<Offset> _slide;
  late Animation<double> _lineScale;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _fade = CurvedAnimation(parent: _mainController, curve: Curves.easeInOut);

    _scale = Tween<double>(begin: 1.15, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeOutExpo),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeOutCubic),
    );

    _lineScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _mainController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      _mainController.reverse().then((_) {
        context.go(AppRouter.loginScreen);
      });
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  Widget _dot(int index) {
    return AnimatedBuilder(
      animation: _dotController,
      builder: (_, __) {
        final value = (_dotController.value * 3 - index).clamp(0.0, 1.0);
        return Opacity(
          opacity: value,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fade,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Background
            ScaleTransition(
              scale: _scale,
              child: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
            ),

            /// Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            /// Content
            SlideTransition(
              position: _slide,
              child: Column(
                children: [
                  const Spacer(),

                  Text(
                    'HOMESTA',
                    style: TextStyle(
                      fontSize: 50.sp,
                      letterSpacing: 2,
                      color: ColorManager.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  ScaleTransition(
                    scale: _lineScale,
                    child: Container(
                      width: 220.w,
                      height: 2,
                      color: ColorManager.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  FadeTransition(
                    opacity: _fade,
                    child: Text(
                      'Furniture & Living',
                      style: TextStyle(
                        fontSize: 16.sp,
                        letterSpacing: 1.2,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_dot(0), _dot(1), _dot(2)],
                  ),
                  const Spacer(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
