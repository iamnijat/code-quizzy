part of widgets;

class ScoreCorrectAnswersTitle extends StatelessWidget {
  const ScoreCorrectAnswersTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mainPaddingStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 5.5.h,
              width: 5.5.h,
              decoration: AppStyles.mainBoxDecorationStyle,
              child: const Icon(
                Icons.code_rounded,
                color: AppPalette.whiteColor,
              )),
          SizedBox(
            width: 2.h,
          ),
          Text(
            "Correct Answers",
            style: AppStyles.scoreWrongAnswersTitleStyle,
          )
        ],
      ),
    );
  }
}
