part of widgets;

class CounterNextButton extends StatelessWidget {
  final VoidCallback nextPress;
  const CounterNextButton({Key? key, required this.nextPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
            onPressed: () {
              nextPress();
            },
            child: Text(
              "Next",
              style: AppStyles.counterNextButtonStyle,
            ))
      ],
    );
  }
}
