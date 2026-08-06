part of pages;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationService get navigation =>
      Provider.of<NavigationService>(context, listen: false);
  QuizRepository get quizRepo =>
      Provider.of<QuizRepository>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const HomeAppbar(),
            Consumer<QuizRepository>(
              builder: (context, quiz, widget) => HomePercentageBubble(
                onQuizTap: _continueQuiz,
                percentage: quiz.score,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TestBubbles(
              onCategoryTap: _categoryQuiz,
              onRandomTap: _randomQuiz,
              onTestTap: _continueQuiz,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: AppStyles.mainPaddingStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Last Activity",
                    style: AppStyles.homePercentageContainerTitleStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const LastActivity(),
          ],
        ),
      ),
    );
  }

  void _continueQuiz() {
    navigation.openSelectNumberOfQuestionsPage(context, withReplacement: false);
  }

  //Push the quiz page first so a failed load can replace it with the error
  //page instead of being covered by it.
  void _categoryQuiz() {
    navigation.openQuizPage(context, withReplacement: false);
    quizRepo.getCategoryQuizData(context);
  }

  void _randomQuiz() {
    navigation.openQuizPage(context, withReplacement: false);
    quizRepo.getRandomQuizData(context);
  }
}
