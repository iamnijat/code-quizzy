part of pages;

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Column(
        children: const <Widget>[
          IntroImage(),
          IntroTitle(),
          IntroButton(),
        ],
      ),
    );
  }
}
