part of dialogs;

class GestureSuggestionDialog extends StatelessWidget {
  const GestureSuggestionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: AppPalette.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 35.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    color: AppPalette.transparentColor,
                    child: Image.asset(AppImages.gestureSuggestion)),
                Padding(
                  padding: AppStyles.mainPaddingStyle,
                  child: DefaultTextStyle(
                    style: TextStyle(
                        color: AppPalette.homeHeadlineColor,
                        fontSize: 18.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                      animatedTexts: [
                        WavyAnimatedText("Swipe left"),
                        WavyAnimatedText("Swipe right"),
                        WavyAnimatedText("You are good to go"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
