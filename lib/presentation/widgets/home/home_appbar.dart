part of widgets;

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.secondaryPaddingStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 15.h,
              width: 20.w,
              alignment: Alignment.center,
              color: AppPalette.transparentColor,
              child: SvgPicture.asset(AppImages.coderIcon)),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "Hello, Coder",
            style: AppStyles.quizQuestionTextStyle,
          ),
        ],
      ),
    );
  }
}
