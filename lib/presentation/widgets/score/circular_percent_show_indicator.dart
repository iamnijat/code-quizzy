part of widgets;

class CircularPercentShowIndicator extends StatelessWidget {
  final double percent;

  const CircularPercentShowIndicator({Key? key, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 9.h,
      lineWidth: 23.0,
      animation: true,
      animationDuration: 1500,
      percent: percent,
      backgroundColor: AppPalette.progressBarColor,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppPalette.homeButtonColor,
    );
  }
}
