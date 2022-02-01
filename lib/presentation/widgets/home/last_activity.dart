part of widgets;

class LastActivity extends StatelessWidget {
  const LastActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizRepository>(
      builder: (context, quiz, widget) => Padding(
        padding: AppStyles.mainPaddingStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 10.h,
                  width: 11.w,
                  alignment: Alignment.center,
                  color: AppPalette.transparentColor,
                  child: Image.asset(quiz.topicImage.toString()),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  quiz.topic.toString(),
                  style: AppStyles.lastActivityHomeTopicTextStyle,
                )
              ],
            ),
            Row(
              children: <Widget>[
                const Icon(Icons.text_rotation_angledown,
                    color: AppPalette.greenColor),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  quiz.score!.toStringAsFixed(0) + "%",
                  style: AppStyles.lastActivityHomeScoreTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
