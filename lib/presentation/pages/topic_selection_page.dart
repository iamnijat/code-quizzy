part of pages;

class TopicSelectionPage extends StatefulWidget {
  const TopicSelectionPage({Key? key}) : super(key: key);

  @override
  State<TopicSelectionPage> createState() => _TopicSelectionPageState();
}

class _TopicSelectionPageState extends State<TopicSelectionPage> {
  List<TopicSelectionModel> topicsList = <TopicSelectionModel>[];
  int listIndex = 0;

  @override
  void didChangeDependencies() {
    topicsList.addAll(Topics.getAllTopics());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.h),
              child: CounterNextButton(nextPress: () {
                _openDifficultyPage();
              }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.h),
              child: Text(
                "Which topic do you want to choose?\n",
                textAlign: TextAlign.center,
                style: AppStyles.counterTitleTextStyle,
              ),
            ),
            GridView.builder(
                padding: AppStyles.secondaryPaddingStyle,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 100.w / (100.h / 1.8),
                    mainAxisSpacing: 15),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: topicsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        for (var element in topicsList) {
                          element.isSelected = false;
                        }
                        topicsList[index].isSelected = true;
                        listIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                        boxShadow: [
                          AppStyles.topicContainerShadow,
                        ],
                        color: topicsList[index].isSelected
                            ? AppPalette.homeButtonColor
                            : AppPalette.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              ZoomIn(
                                duration: const Duration(seconds: 2),
                                child: Container(
                                  height: 10.h,
                                  width: 15.w,
                                  alignment: Alignment.center,
                                  color: AppPalette.transparentColor,
                                  child: Image.asset(
                                      topicsList[index].imgUrl.toString()),
                                ),
                              ),
                              Text(topicsList[index].title.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    color: topicsList[index].isSelected
                                        ? AppPalette.whiteColor
                                        : AppPalette.homeHeadlineColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  void _openDifficultyPage() {
    Provider.of<QuizRepository>(context, listen: false).setTopic(
      topicStr: topicsList[listIndex].title,
    );

    Provider.of<QuizRepository>(context, listen: false).setImage(
      imgUrl: topicsList[listIndex].imgUrl,
    );
    Provider.of<NavigationService>(context, listen: false)
        .openDifficultyPage(context, withReplacement: true);
  }
}
