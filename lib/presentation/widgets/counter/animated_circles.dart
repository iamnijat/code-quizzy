part of widgets;

class AnimatedCircles extends StatelessWidget {
  const AnimatedCircles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPalette.whiteColor,
      width: 70.0.w,
      height: deviceTablet ? 33.0.h : 28.h,
      child: const FlareActor(AppImages.counterFlare,
          animation: "Alarm", color: AppPalette.homeHeadlineColor),
    );
  }
}
