part of modal_bottom_sheets;

class NewHabitModalBottomSheet extends StatelessWidget {
  const NewHabitModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Material(
      type: MaterialType.transparency,
      child: Column(children: <Widget>[]),
    ));
  }
}
