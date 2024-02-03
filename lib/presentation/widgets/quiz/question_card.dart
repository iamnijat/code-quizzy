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
    var answers = data.answers!;
    return SingleChildScrollView(
      child: Consumer<QuizRepository>(
        builder: (context, quiz, widget) => Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Text(
                data.question!,
                textAlign: TextAlign.center,
                style: AppStyles.quizQuestionTextStyle,
              ),
            ),
            if (answers.answerA != null)
              Option(
                onCheckAnswerTap: () => quiz.checkAns(answers.answerA!, index!),
                text: answers.answerA.toString(),
              ),
            if (answers.answerB != null)
              Option(
                onCheckAnswerTap: () => quiz.checkAns(answers.answerB!, index!),
                text: answers.answerB.toString(),
              ),
            if (answers.answerC != null)
              Option(
                onCheckAnswerTap: () => quiz.checkAns(answers.answerC!, index!),
                text: answers.answerC.toString(),
              ),
            if (answers.answerD != null)
              Option(
                onCheckAnswerTap: () =>
                    quiz.checkAns(data.answers!.answerD!, index!),
                text: data.answers?.answerD.toString(),
              ),
            if (data.answers!.answerE != null)
              Option(
                onCheckAnswerTap: () => quiz.checkAns(answers.answerE!, index!),
                text: answers.answerE.toString(),
              ),
            if (answers.answerF != null)
              Option(
                onCheckAnswerTap: () => quiz.checkAns(answers.answerF!, index!),
                text: answers.answerF.toString(),
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
