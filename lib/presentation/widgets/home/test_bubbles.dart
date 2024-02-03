part of widgets;

class TestBubbles extends StatelessWidget {
  const TestBubbles({
    Key? key,
    required this.onCategoryTap,
    required this.onRandomTap,
    required this.onTestTap,
  }) : super(key: key);
  final VoidCallback onCategoryTap;
  final VoidCallback onRandomTap;
  final VoidCallback onTestTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.mainPaddingStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: onCategoryTap,
                child: Container(
                  height: 14.h,
                  width: 46.w,
                  decoration: AppStyles.homeCategoryBoxdecorationStyle,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 4.h,
                          width: 14.w,
                          color: AppPalette.transparentColor,
                          child: Image.asset(AppImages.categoryImage)),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Center(
                        child: Text(
                          "Category\n",
                          textAlign: TextAlign.center,
                          style: AppStyles.homeBubblesTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: onRandomTap,
                child: Container(
                  height: 14.h,
                  width: 45.w,
                  decoration: AppStyles.homeRandomTestDecorationStyle,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 4.h,
                          width: 14.w,
                          color: AppPalette.transparentColor,
                          child: Image.asset(AppImages.randomTestImage)),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Center(
                        child: Text(
                          "Random Quiz\n",
                          textAlign: TextAlign.center,
                          style: AppStyles.homeBubblesTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onTestTap,
            child: Container(
              height: 31.h,
              width: 38.w,
              decoration: AppStyles.homeTakeTestDecorationStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 8.h,
                      width: 30.w,
                      color: AppPalette.transparentColor,
                      child: Image.asset(AppImages.takeTestImage)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: Text(
                      "Take a Test!\n",
                      textAlign: TextAlign.center,
                      style: AppStyles.homeBubblesTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
