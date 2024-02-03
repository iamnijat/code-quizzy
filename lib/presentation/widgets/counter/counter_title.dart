part of widgets;

class CounterTitle extends StatelessWidget {
  const CounterTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mainPaddingStyle,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "How many questions do you want to answer?\n",
            style: AppStyles.counterTitleTextStyle,
          ),
          TextSpan(
            text: "Choose a number between 1 and 10",
            style: AppStyles.counterDescTextStyle,
          ),
        ]),
      ),
    );
  }
}
