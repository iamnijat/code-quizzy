part of pages;

class DifficultyPage extends StatefulWidget {
  const DifficultyPage({Key? key}) : super(key: key);

  @override
  State<DifficultyPage> createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    buildSlidePages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const DifficultyTitle(),
          Expanded(
            flex: 2,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              itemCount: 4,
              itemBuilder: (ctx, i) => DifficultySlider(
                i,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    currentPage = index;
  }

  void buildSlidePages() {
    if (currentPage < 3) {
      currentPage++;
    } else {
      currentPage = 0;
    }
    if (pageController.hasClients) {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
