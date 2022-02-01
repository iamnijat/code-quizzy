part of widgets;

class EmphasizedButton extends StatelessWidget {
  final String title;
  final VoidCallback onButtonTap;

  const EmphasizedButton(
      {Key? key, required this.title, required this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: deviceTablet ? 9.h : 8.h,
      margin: EdgeInsets.only(top: 4.h),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppPalette.homeButtonColor,
      ),
      child: Material(
        color: AppPalette.transparentColor,
        child: InkWell(
            onTap: onButtonTap,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.difficultyButtonStyle,
              ),
            )),
      ),
    );
  }
}
