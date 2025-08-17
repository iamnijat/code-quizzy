part of widgets;

class AnimatedCircles extends StatelessWidget {
  final int counterValue;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const AnimatedCircles({
    Key? key,
    required this.counterValue,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppPalette.whiteColor,
        width: 70.0.w,
        height: deviceTablet ? 33.0.h : 28.h,
        child: CounterCircleAnimation(
          number: counterValue,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ));
  }
}

class CounterCircleAnimation extends StatefulWidget {
  final int number;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCircleAnimation({
    Key? key,
    required this.number,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  _CounterCircleAnimationState createState() => _CounterCircleAnimationState();
}

class _CounterCircleAnimationState extends State<CounterCircleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotateController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    // Pulse animation for the main circle
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Rotation animation for decorative elements
    _rotateController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _rotateAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.linear),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _pulseController.repeat(reverse: true);
    _rotateController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseController, _rotateController]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Rotating decorative circles
            Transform.rotate(
              angle: _rotateAnimation.value,
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppPalette.homeButtonColor.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    // Small decorative dots
                    Positioned(
                      top: 0,
                      left: 50.w * 0.5 - 2,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPalette.homeButtonColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 50.w * 0.5 - 2,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPalette.homeButtonColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main counter circle with pulse animation
            Transform.scale(
              scale: _pulseAnimation.value,
              child: Container(
                width: 35.w,
                height: 35.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.homeButtonColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppPalette.homeButtonColor.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.number.toString(),
                    style: TextStyle(
                      color: AppPalette.whiteColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ),

            // Plus button (top right)
            Positioned(
              top: 8.h,
              right: 8.w,
              child: GestureDetector(
                onTap: widget.onIncrement,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.homeButtonColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppPalette.homeButtonColor.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppPalette.whiteColor,
                    size: 6.w,
                  ),
                ),
              ),
            ),

            // Minus button (bottom left)
            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: GestureDetector(
                onTap: widget.onDecrement,
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.homeButtonColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppPalette.homeButtonColor.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.remove,
                    color: AppPalette.whiteColor,
                    size: 6.w,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    super.dispose();
  }
}
