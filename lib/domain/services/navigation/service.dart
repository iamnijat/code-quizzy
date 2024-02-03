part of navigation;

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  const NavigationService();

  void openSplashPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.splash)
          : Navigator.pushNamed(context, NavigationRoutes.splash);
  void openIntroPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.intro)
          : Navigator.pushNamed(context, NavigationRoutes.intro);

  void openHomePage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.home)
          : Navigator.pushNamed(context, NavigationRoutes.home);
  void openSelectNumberOfQuestionsPage(BuildContext context,
          {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.counter)
          : Navigator.pushNamed(context, NavigationRoutes.counter);
  void openTopicSelectionPage(BuildContext context,
          {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(
              context, NavigationRoutes.topicSelection)
          : Navigator.pushNamed(context, NavigationRoutes.topicSelection);
  void openDifficultyPage(BuildContext context,
          {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.difficulty)
          : Navigator.pushNamed(context, NavigationRoutes.difficulty);
  void openQuizPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.quizPage)
          : Navigator.pushNamed(context, NavigationRoutes.quizPage);

  void openScorePage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.scorePage)
          : Navigator.pushNamed(context, NavigationRoutes.scorePage);
  void openErrorPage(BuildContext context, {bool withReplacement = false}) =>
      withReplacement
          ? Navigator.pushReplacementNamed(context, NavigationRoutes.errorPage)
          : Navigator.pushNamed(context, NavigationRoutes.errorPage);

  void back(BuildContext context, {dynamic result}) =>
      Navigator.pop(context, result);
}
