part of pages;

class TopicSelectionPage extends StatefulWidget {
  const TopicSelectionPage({Key? key}) : super(key: key);

  @override
  State<TopicSelectionPage> createState() => _TopicSelectionPageState();
}

class _TopicSelectionPageState extends State<TopicSelectionPage> {
  String? selectedCategoryId;
  String? selectedCategoryName;
  String? selectedIconName;

  @override
  void initState() {
    super.initState();
    //Deferred to after the frame: load() notifies its listeners synchronously,
    //which is not allowed while the tree is still building.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Provider.of<CategoryRepository>(context, listen: false).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Consumer<CategoryRepository>(
        builder: (context, categories, widget) {
          if (categories.error != null && !categories.hasCategories) {
            return _buildError(categories);
          }
          //Covers both "loading" and "not started yet"
          if (!categories.hasCategories) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildTopics(categories);
        },
      ),
    );
  }

  Widget _buildError(CategoryRepository categories) {
    final error = categories.error ?? const ServerException();
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              error.title,
              textAlign: TextAlign.center,
              style: AppStyles.counterTitleTextStyle,
            ),
            SizedBox(height: 2.h),
            Text(
              error.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppPalette.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
                fontSize: 13.2.sp,
                height: 1.5,
              ),
            ),
            SizedBox(height: 3.h),
            EmphasizedButton(
              title: "Try Again",
              onButtonTap: () => categories.load(force: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopics(CategoryRepository categories) {
    return SingleChildScrollView(
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
          for (final group in categories.groups) ..._buildGroup(group),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGroup(CategoryGroup group) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h, bottom: 1.h),
        child: Row(
          children: <Widget>[
            Icon(
              CategoryIcons.resolve(group.icon),
              size: 2.6.h,
              color: AppPalette.homeButtonColor,
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                group.name ?? '',
                style: AppStyles.homePercentageContainerTitleStyle,
              ),
            ),
          ],
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
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: group.categories.length,
        itemBuilder: (context, index) {
          final category = group.categories[index];
          final isSelected = category.id == selectedCategoryId;
          return InkWell(
            onTap: () {
              setState(() {
                selectedCategoryId = category.id;
                selectedCategoryName = category.name;
                selectedIconName = group.icon;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                boxShadow: [
                  AppStyles.topicContainerShadow,
                ],
                color: isSelected
                    ? AppPalette.homeButtonColor
                    : AppPalette.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ZoomIn(
                    duration: const Duration(seconds: 2),
                    child: Container(
                      height: 8.h,
                      width: 15.w,
                      alignment: Alignment.center,
                      color: AppPalette.transparentColor,
                      child: Icon(
                        CategoryIcons.resolve(group.icon),
                        size: 5.h,
                        color: isSelected
                            ? AppPalette.whiteColor
                            : AppPalette.homeButtonColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(category.name ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppPalette.whiteColor
                              : AppPalette.homeHeadlineColor,
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ];
  }

  void _openDifficultyPage() {
    if (selectedCategoryName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pick a topic to continue")),
      );
      return;
    }

    Provider.of<QuizRepository>(context, listen: false).setTopic(
      topicStr: selectedCategoryName,
    );

    Provider.of<QuizRepository>(context, listen: false).setTopicIcon(
      iconName: selectedIconName,
    );
    Provider.of<NavigationService>(context, listen: false)
        .openDifficultyPage(context, withReplacement: true);
  }
}
