part of widgets;

class DifficultyTitle extends StatelessWidget {
  const DifficultyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Please, select the difficulty level to play in this game",
            style: AppStyles.counterTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "Please, slide to choose the difficulty level",
            style: AppStyles.difficultyDescStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
