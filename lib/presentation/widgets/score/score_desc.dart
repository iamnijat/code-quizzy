part of widgets;

class ScoreDesc extends StatelessWidget {
  final double percentage;

  const ScoreDesc({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Mission Completed\n",
            style: AppStyles.scorePercentageTitleStyle,
          ),
          TextSpan(
            text: "${(percentage * 100).toStringAsFixed(2)}%",
            style: AppStyles.scorePercentageDescTextStyle,
          ),
        ]),
      ),
    );
  }
}
