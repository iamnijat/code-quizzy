part of widgets;

class PlasmaBackground extends StatelessWidget {
  const PlasmaBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: const BoxDecoration(
        color: AppPalette.whiteColor,
        backgroundBlendMode: BlendMode.srcOver,
      ),
    );
  }
}
