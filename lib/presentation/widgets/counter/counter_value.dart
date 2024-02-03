part of widgets;

class CounterValue extends StatelessWidget {
  const CounterValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? counterValue = context
        .select((CounterCubit counterCubit) => counterCubit.state.counterValue)
        .toString();
    return Text(
      counterValue,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 36.9.sp, color: Colors.white),
    );
  }
}
