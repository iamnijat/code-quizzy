part of widgets;

class CorrectAnswersBuilder extends StatelessWidget {
  const CorrectAnswersBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizRepository>(
      builder: (context, quiz, widget) => MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: quiz.questionsListLength,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var correctAnswer = CorrectAnswerDefiner.getCorrectAnswer(
                  index: index, questionsList: quiz.questionsList);
              var topic = quiz.questionsList?[index]?.category;
              return Padding(
                padding: AppStyles.scoreListviewPaddingStyle,
                child: SizedBox(
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 3.h,
                        width: 3.h,
                        decoration: AppStyles.mainBoxDecorationStyle,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          Container(
                              height: 15.h,
                              width: 40.w,
                              decoration:
                                  AppStyles.scoreAnswersBoxDecorationStyle,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.w, top: 1.h, right: 4.w),
                                    child: Text(
                                      "${index + 1}. ${topic.toString()}",
                                      style: AppStyles
                                          .scoreCorrectAnswerCategoryStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 4.w, bottom: 1.h, right: 4.w),
                                    child: Text(
                                      "$correctAnswer",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style:
                                          AppStyles.scoreCorrectAnswerDessStyle,
                                    ),
                                  )
                                ],
                              )),
                          const CorrectAnswerCheckboxWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
