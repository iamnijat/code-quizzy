part of pages;

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  void _goToHome() => Provider.of<NavigationService>(context, listen: false)
      .openHomePage(context, withReplacement: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.h, left: 6.w, right: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const ScoreTitle(),
                  IconButton(
                      onPressed: _goToHome,
                      icon: Icon(
                        Icons.restart_alt_outlined,
                        size: 4.5.h,
                        color: AppPalette.headlineFourthColor,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Consumer<QuizRepository>(
              builder: (context, quiz, widget) => Padding(
                padding: AppStyles.mainPaddingStyle,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircularPercentShowIndicator(
                      percent: quiz.numOfCorrectAns / quiz.questionsListLength!,
                    ),
                    ScoreDesc(
                      percentage:
                          quiz.numOfCorrectAns / quiz.questionsListLength!,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            const ScoreCorrectAnswersTitle(),
            SizedBox(
              height: 2.h,
            ),
            const CorrectAnswersBuilder(),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}
