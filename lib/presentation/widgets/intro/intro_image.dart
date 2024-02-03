part of widgets;

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: 100.w,
        alignment: Alignment.center,
        color: AppPalette.transparentColor,
        child: SvgPicture.asset(AppImages.homeImage));
  }
}
