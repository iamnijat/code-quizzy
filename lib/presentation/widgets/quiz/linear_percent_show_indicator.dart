part of widgets;

class LinearPercentShowIndicator extends StatelessWidget {
  const LinearPercentShowIndicator({
    Key? key,
    required this.index,
    required this.length,
  }) : super(key: key);

  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
        backgroundColor: AppPalette.progressBarColor,
        width: 75.w,
        animation: true,
        lineHeight: 2.5.h,
        animationDuration: 800,
        percent: index / length,
        barRadius: const Radius.circular(15),
        progressColor: AppPalette.homeButtonColor);
  }
}
