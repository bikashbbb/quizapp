import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// here we will play the quiz game, check if its which mode
class QuizBattle extends StatefulWidget {
  List questionbank;
  bool isexammode;

  QuizBattle(this.questionbank, {Key? key, this.isexammode = false})
      : super(key: key);

  @override
  _QuizBattleState createState() => _QuizBattleState();
}

class _QuizBattleState extends State<QuizBattle> {
  int currentQsn = 1;
  Color answeColor = Colors.white;
  int selectedans = 20;
  int? correctAns;
  int? wronganswer;
  bool istapped = false;
  @override
  void initState() {
    selectedans = 20;
    correctAns = 20;
    wronganswer = 20;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalquestions = widget.questionbank.length;
    String question = widget.questionbank[currentQsn - 1].keys.elementAt(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 360.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepProgressIndicator(
                totalSteps: widget.questionbank.length,
                currentStep: currentQsn,
                selectedColor: Colors.black,
                unselectedColor: Colors.grey.shade300,
              ),
              Divider(
                height: 25.h,
                color: Colors.white,
              ),
              // question number,
              Text(
                'Question $currentQsn/$totalquestions'.toString(),
                style: TextStyle(color: Colors.black, fontSize: 30.sp),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
              ),
              // question here
              Text(
                question,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.h,
              ),
              // asnwers
              answerTile(question, 0),
              answerTile(question, 1),
              answerTile(question, 2),
              answerTile(question, 3),
              SizedBox(
                height: 65.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          backgroundColor: Colors.grey[600],
                          onSurface: Colors.grey,
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          if (currentQsn > 1) {
                            currentQsn -= 1;
                            setState(() {});
                          }
                        },
                        child: const Text("  ATRÁS  ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.w700,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          backgroundColor: Colors.red[600],
                          onSurface: Colors.grey,
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          if (currentQsn < totalquestions) {
                            setState(() {
                              currentQsn += 1;
                              correctAns = wronganswer = 20;
                              istapped = false;
                            });
                          }
                        },
                        child: const Text("SIGUIENTE",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Bahnschrift",
                              fontWeight: FontWeight.w700,
                            ))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget answerTile(String question, int qsnNo) {
    return InkWell(
      onTap: () {
        istapped = true;
        wronganswer = qsnNo;
        // if qsn is correct
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 13.h),
        child: Builder(builder: (context) {
          correctAns =
              int.parse(widget.questionbank[currentQsn - 1]['answers']) - 1;
          if (qsnNo == correctAns && istapped) {
            return Material(
              elevation: 3,
              child: AnimatedContainer(
                alignment: Alignment.centerLeft,
                color: Colors.green,
                duration: const Duration(milliseconds: 300),
                height: 60.h,
                width: 360.w,
                child: Text(
                  widget.questionbank[currentQsn - 1][question][qsnNo],
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          } else if (qsnNo == wronganswer && istapped) {
            return Material(
              elevation: 3,
              child: AnimatedContainer(
                alignment: Alignment.centerLeft,
                color: Colors.red[300],
                duration: const Duration(milliseconds: 300),
                height: 60.h,
                width: 360.w,
                child: Text(
                  widget.questionbank[currentQsn - 1][question][qsnNo],
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          } else {
            return Material(
              elevation: 3,
              child: AnimatedContainer(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                duration: const Duration(milliseconds: 300),
                height: 60.h,
                width: 360.w,
                child: Text(
                  widget.questionbank[currentQsn - 1][question][qsnNo],
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
