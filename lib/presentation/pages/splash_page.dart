part of pages;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkFirstPage();
  }

  Future<void> _checkFirstPage() async {
    var _provider = Provider.of<QuizRepository>(context, listen: false);
    _provider.getScoreCredentials(context);
    final _lastScore =
        await Provider.of<ScoreStoreRepository>(context, listen: false)
            .quizLastScore;
    _provider.getLastQuizScore(context);

    if (_lastScore == null) {
      Timer(const Duration(seconds: 4), _openIntroPage);
    } else {
      Timer(const Duration(seconds: 4), _openHomePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          SplashAnimation(),
        ],
      ),
    );
  }

  void _openIntroPage() {
    Provider.of<NavigationService>(context, listen: false)
        .openIntroPage(context, withReplacement: true);
  }

  void _openHomePage() {
    Provider.of<NavigationService>(context, listen: false)
        .openHomePage(context, withReplacement: true);
  }
}
