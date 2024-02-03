part of pages;

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  String? counterValue;

  @override
  void initState() {
    super.initState();
    _checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    counterValue = context
        .select((CounterCubit counterCubit) => counterCubit.state.counterValue)
        .toString();
    return Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: Swipe(
          onSwipeLeft: () {
            context.read<CounterCubit>().decrement();
          },
          onSwipeRight: () {
            context.read<CounterCubit>().increment();
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.h),
                child: CounterNextButton(
                  nextPress: _openTopicSelectionPage,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              const CounterTitle(),
              Stack(
                alignment: Alignment.center,
                children: [
                  const PlasmaBackground(),
                  Positioned(
                    top: 15.0.h,
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedCircles(),
                        CounterValue(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _checkFirstSeen() async {
    final _seen =
        await Provider.of<SharedPreferencesStore>(context, listen: false)
            .getFirstSeen();
    if (_seen == true) return;
    Future.delayed(const Duration(seconds: 1), () {
      showGestureSuggestionDialog(context);
    });
  }

  void _openTopicSelectionPage() {
    Provider.of<QuizRepository>(context, listen: false).setNumOfQuestions(
      counterValue: counterValue,
    );
    Provider.of<SharedPreferencesStore>(context, listen: false).setFirstSeen();
    Provider.of<NavigationService>(context, listen: false)
        .openTopicSelectionPage(context, withReplacement: false);
  }
}
