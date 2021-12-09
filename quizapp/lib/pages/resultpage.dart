import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/pages/category.dart';
import 'package:quizapp/palette/styles.dart';

class ResultPage extends StatefulWidget {
  List question;
  List rightAnswers;
  List wronganswer;

  ResultPage(this.question, this.rightAnswers, this.wronganswer, {Key? key})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool iscorrectans = true;
  @override
  Widget build(BuildContext context) {
    int totalrightanswers = widget.rightAnswers.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Results'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => CategoryPage()));
              },
              child: const Icon(
                Icons.exit_to_app,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: Text(
              'You scored: $totalrightanswers /30',
              style: bold20,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              answerbuttons('Right Answers'),
              answerbuttons('Wrong Answers')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iscorrectans
                  ? Container(
                      color: Colors.green,
                      height: 35.h,
                      width: 6.w,
                    )
                  : const SizedBox(),
              iscorrectans
                  ? const SizedBox()
                  : Container(
                      color: Colors.red,
                      height: 35.h,
                      width: 6.w,
                    ),
            ],
          ),
          resultGround()
        ],
      ),
    );
  }

  Widget answerbuttons(String name) {
    return InkWell(
      onTap: () {
        // show a tile of right answers
        if (name[0] == 'R') {
          iscorrectans = true;
        } else {
          iscorrectans = false;
        }
        setState(() {});
      },
      child: Container(
          decoration: BoxDecoration(
              color: name[0] == 'R' ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          height: 40.h,
          width: 130.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              name[0] == 'R'
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
            ],
          )),
    );
  }

  Widget resultGround() {
    return Container(
      color: iscorrectans ? Colors.green[100] : Colors.red[100],
      height: 600.h,
      width: 382.w,
      child: iscorrectans
          ? ListView.builder(
              itemCount: widget.rightAnswers.length, //question.length,
              itemBuilder: (context, index) {
                return wronganswer(
                    widget.rightAnswers[index], (index + 1).toString());
              })
          : ListView.builder(
              itemCount: widget.wronganswer.length, //question.length,
              itemBuilder: (context, index) {
                return wronganswer(
                    widget.wronganswer[index], (index + 1).toString());
              }),
    );
  }

  Widget answerTile(int index, String num) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
          alignment: Alignment(-0.94.w, 0),
          color: Colors.white30,
          width: 360.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                num + '. ',
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  widget.question[index].keys.elementAt(0),
                  style: bold20,
                ),
              ),
            ],
          )),
    );
  }

  Widget wronganswer(int index, String num) {
    var question = widget.question[index].keys.elementAt(0);
    //String answer = question[];
    int answerindex = int.parse(widget.question[index]['answers']) - 1;
    String answer = (widget.question[index][question])[answerindex];

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
          alignment: Alignment(-0.94.w, 0),
          color: Colors.white30,
          width: 360.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    num + '. ',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 350.w,
                    child: Text(
                      question,
                      style: bold20,
                    ),
                  ),
                ],
              ),
              Text(
                '                            Correct answer',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  child: Text(
                answer,
                style: TextStyle(color: Colors.black45, fontSize: 20.sp),
              ))
            ],
          )),
    );
  }
}
