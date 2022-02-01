part of widgets;

class HomePercentageBubble extends StatelessWidget {
  const HomePercentageBubble({
    Key? key,
    required this.percentage,
    required this.onQuizTap,
  }) : super(key: key);
  final double? percentage;
  final VoidCallback onQuizTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mainPaddingStyle,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                  color: AppPalette.homeContainerColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildPercentIndicator(),
                  SizedBox(
                    width: 45.w,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: percentage! > 50
                              ? "Good Result!\n\n"
                              : "Bad Result!\n\n",
                          style: AppStyles.homePercentageContainerTitleStyle,
                        ),
                        TextSpan(
                          text: percentage! > 50
                              ? "Your  👨‍💻  has been improved."
                              : "Your  👨‍💻  has been deteriorated.",
                          style: AppStyles.homePercentageContainerDescStyle,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: -2.5.h,
                child: InkWell(
                  onTap: onQuizTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppPalette.homeButtonColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 6.h,
                    width: 48.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow_rounded,
                          color: AppPalette.whiteColor,
                          size: 4.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "Continue",
                          style: TextStyle(
                              color: AppPalette.whiteColor,
                              fontFamily: "Poppins",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  CircularPercentIndicator buildPercentIndicator() {
    return CircularPercentIndicator(
      radius: 5.5.h,
      lineWidth: 17.0,
      animation: true,
      animationDuration: 1500,
      percent: percentage! / 100,
      center: Text(
        percentage!.toStringAsFixed(0) + "%",
        style: AppStyles.homePercentageTextStyle,
      ),
      backgroundColor: AppPalette.progressBarColor,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: AppPalette.homeButtonColor,
    );
  }
}
