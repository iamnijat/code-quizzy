part of widgets;

class IntroButton extends StatefulWidget {
  const IntroButton({Key? key}) : super(key: key);

  @override
  _IntroButtonState createState() => _IntroButtonState();
}

class _IntroButtonState extends State<IntroButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          width: 70.w,
          height: deviceTablet ? 9.h : 8.h,
          margin: EdgeInsets.only(bottom: 6.h),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppPalette.homeButtonColor,
          ),
          child: Material(
            color: AppPalette.transparentColor,
            child: InkWell(
                onTap: _openNumberOfQuestionsPage,
                child: Center(
                  child: Text(
                    "Start now",
                    textAlign: TextAlign.center,
                    style: AppStyles.homeButtonTextStyle,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  void _openNumberOfQuestionsPage() {
    Provider.of<NavigationService>(context, listen: false)
        .openSelectNumberOfQuestionsPage(context, withReplacement: false);
  }
}
