part of widgets;

class CorrectAnswerCheckboxWidget extends StatelessWidget {
  const CorrectAnswerCheckboxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: -3.w,
        top: -3.w,
        child: Container(
          height: 4.h,
          width: 4.h,
          decoration: AppStyles.mainBoxDecorationStyle,
          child: Icon(
            Icons.done,
            size: 3.h,
            color: AppPalette.whiteColor,
          ),
        ));
  }
}
