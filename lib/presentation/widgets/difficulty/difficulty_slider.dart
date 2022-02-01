part of widgets;

class DifficultySlider extends StatefulWidget {
  final int index;

  const DifficultySlider(this.index, {Key? key}) : super(key: key);

  @override
  _DifficultySliderState createState() => _DifficultySliderState();
}

class _DifficultySliderState extends State<DifficultySlider> {
  QuizRepository get quizRepo =>
      Provider.of<QuizRepository>(context, listen: false);
  final _introSliderList = <DifficultyModel>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _introSliderList.addAll(Difficulty.getDifficultyList());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: <Widget>[
            Container(
                height: 38.h,
                width: 80.w,
                padding: EdgeInsets.only(top: 5.h),
                alignment: Alignment.center,
                color: AppPalette.transparentColor,
                child: SvgPicture.asset(
                    _introSliderList[widget.index].slideImgUrl.toString())),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
              child: EmphasizedButton(
                  title: _introSliderList[widget.index].slideTitle.toString(),
                  onButtonTap: setDifficulty),
            ),
          ],
        ),
      ),
    );
  }

  void setDifficulty() {
    quizRepo.setDifficulty(
      difficultyStr: _introSliderList[widget.index].slideTitle,
    );
    quizRepo.getQuizData(context);
    Provider.of<NavigationService>(context, listen: false)
        .openQuizPage(context, withReplacement: false);
  }
}
