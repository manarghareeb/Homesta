import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class StartChatButton extends StatefulWidget {
  final VoidCallback? onSwipeRight;
  final VoidCallback? onSwipeLeft;

  const StartChatButton({super.key, this.onSwipeRight, this.onSwipeLeft});

  @override
  State<StartChatButton> createState() => _StartChatButtonState();
}

class _StartChatButtonState extends State<StartChatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  bool _isPressed = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 0.0, end: -1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _playSwapAnimation() {
    if (!_isAnimating) {
      _isAnimating = true;
      _animationController.forward().then((_) {
        _animationController.reverse().then((_) {
          _isAnimating = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    final buttonWidth =
        isSmallScreen
            ? screenWidth * 0.88
            : isMediumScreen
            ? screenWidth * 0.85
            : 320.0;
    final buttonHeight =
        isSmallScreen
            ? 52.0
            : isMediumScreen
            ? 56.0
            : 64.0;
    final iconSize =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 18.0
            : 20.0;
    final fontSize =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 18.0
            : 20.0;
    final arrowButtonSize = buttonHeight + 5;
    final horizontalPadding = isSmallScreen ? 20.0 : 24.0;

    return Padding(
      padding: EdgeInsets.only(right: 135.0, left: 25),
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            if (details.primaryVelocity! > 0) {
              _playSwapAnimation();
              widget.onSwipeRight?.call();
            } else if (details.primaryVelocity! < 0) {
              _playSwapAnimation();
              widget.onSwipeLeft?.call();
            }
          }
        },
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [ColorManager.startchatColor, ColorManager.buttonColor],
                stops: [0.2, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.buttonColor.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: horizontalPadding,
                  top: 0,
                  bottom: 0,

                  child: Center(
                    child: Text(
                      "Start Chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Positioned(
                      right:
                          (_slideAnimation.value *
                              (buttonWidth - arrowButtonSize - 32)),
                      top: (buttonHeight - arrowButtonSize) / 2,
                      child: Container(
                        width: arrowButtonSize - 5,
                        height: arrowButtonSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(5, 14),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: iconSize,
                          color: ColorManager.buttonColor,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
