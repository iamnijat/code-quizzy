part of widgets;

class ProgressBar extends StatelessWidget {
  final int index;
  final int length;

  const ProgressBar({Key? key, required this.index, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LinearPercentShowIndicator(index: index, length: length),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "$index/",
                style: AppStyles.quizProgressBarIndexStyle,
              ),
              TextSpan(
                text: "$length",
                style: AppStyles.quizProgressBarLengthStyle,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
