part of pages;

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  void _comeBack() =>
      Provider.of<NavigationService>(context, listen: false).back(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 27.h,
              width: 85.w,
              alignment: Alignment.center,
              color: AppPalette.transparentColor,
              child: Image.asset(AppImages.failureImage)),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h),
            child: Center(
              child: Text(
                "Server Problem",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPalette.headlineFourthColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gotham Pro",
                  fontSize: 20.2.sp,
                  height: 1.7,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 3.h),
            child: Center(
              child: Text(
                "Check your connection, please come back again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPalette.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: 13.2.sp,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 4.h),
            child: Container(
              height: 7.4.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 125, 130, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _comeBack();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: AppPalette.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: 17.8.sp,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
