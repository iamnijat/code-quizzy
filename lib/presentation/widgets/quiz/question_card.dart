part of widgets;

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
    required this.questionIndex,
  }) : super(key: key);

  final QuizResponse? question;
  final int? questionIndex;

  @override
  Widget build(BuildContext context) {
    var index = questionIndex;
    var data = question!;
    return SingleChildScrollView(
      child: Consumer<QuizRepository>(
        builder: (context, quiz, widget) => Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Text(
                data.text ?? '',
                textAlign: TextAlign.center,
                style: AppStyles.quizQuestionTextStyle,
              ),
            ),
            for (final answer in data.answers)
              if (answer.text != null)
                Option(
                  onCheckAnswerTap: () => quiz.checkAns(answer.text!, index!),
                  text: answer.text,
                ),
            Padding(
                padding: AppStyles.mainPaddingStyle,
                child: EmphasizedButton(
                  onButtonTap: () {
                    quiz.nextQuestion(
                        context: context, index: int.parse(index.toString()));
                  },
                  title: "Next",
                )),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}
