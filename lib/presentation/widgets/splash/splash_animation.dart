part of widgets;

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  _SplashAnimationState createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    _rotateImage();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation!.value,
      child: Container(
          height: 60.h,
          width: 100.w,
          alignment: Alignment.center,
          color: AppPalette.transparentColor,
          child: SvgPicture.asset(AppImages.splashImage)),
    );
  }

  void _rotateImage() {
    animationController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween<double>(begin: 0, end: 2 * math.pi)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(animationController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController?.forward();
        }
      });
    animationController?.forward();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
