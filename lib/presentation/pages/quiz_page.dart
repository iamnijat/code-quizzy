part of pages;

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Consumer<QuizRepository>(
        builder: (context, quiz, widget) => quiz.questionsListLength == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  SplashAnimation(),
                ],
              )
            : NestedScrollView(
                floatHeaderSlivers: true,
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      backgroundColor: AppPalette.whiteColor,
                      automaticallyImplyLeading: false,
                      pinned: true,
                      elevation: 0,
                      expandedHeight: 2.h,
                      floating: false,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(2.h),
                        child: Container(),
                      ),
                      flexibleSpace: ProgressBar(
                          index: quiz.currentPage,
                          length:
                              int.parse(quiz.questionsListLength.toString())),
                    ),
                  ];
                },
                body: Builder(builder: (context) {
                  return PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: quiz.pageController,
                    onPageChanged: quiz.onPageChanged,
                    scrollDirection: Axis.horizontal,
                    itemCount: quiz.questionsListLength,
                    itemBuilder: (context, i) => QuestionCard(
                        question: quiz.questionsList?[i], questionIndex: i),
                  );
                }),
              ),
      ),
    );
  }
}
