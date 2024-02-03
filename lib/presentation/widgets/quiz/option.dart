part of widgets;

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.onCheckAnswerTap,
  }) : super(key: key);
  final String? text;
  final VoidCallback onCheckAnswerTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizRepository>(builder: (context, quiz, widget) {
      return GestureDetector(
        onTap: () {
          onCheckAnswerTap();
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 3.h,
            left: 6.w,
            right: 6.w,
          ),
          padding: AppStyles.secondaryPaddingStyle,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: quiz.getTheRightColor(text)),
          child: Row(
            children: [
              if (quiz.getTheRightColor(text) == AppPalette.homeButtonColor)
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppPalette.homeButtonColor),
                  child: Icon(
                    Icons.done,
                    size: 3.5.h,
                    color: AppPalette.whiteColor,
                  ),
                ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                child: Text(
                  text.toString(),
                  style: TextStyle(
                      color: quiz.getTheRightColor(text) ==
                              AppPalette.homeButtonColor
                          ? AppPalette.whiteColor
                          : Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins"),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
