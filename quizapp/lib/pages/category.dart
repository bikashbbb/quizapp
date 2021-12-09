import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizapp/data/category.dart';
import 'package:quizapp/pages/choosemodes.dart';
import 'package:quizapp/palette/styles.dart';
import 'package:quizapp/questionbank/questions_ebusiness.dart';

// todo: get the category from data into a listview builder... 3v listview builder.
class CategoryPage extends StatelessWidget {
  // list of question in each fases
  List fasei = [];
  List faseii = [];
  List faseiii = ['qsn1', ebusiness, 'qsn3', 'qsn4', 'qsn5', 'qsn6'];

  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 20.h),
                child: const Text(
                  'FASE I',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: 500.h,
                  child: phasesBuilder(fase1, fase1Ects, 1, context)),
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 20.h),
                child: const Text(
                  'FASE II',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: 620.h,
                  child: phasesBuilder(fase2, fase2Ects, 3, context)),
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 20.h),
                child: const Text(
                  'FASE III',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: 400.h,
                  child: phasesBuilder(fase3, fase3Ects, 3, context)),
            ],
          ),
        ));
  }

  /// creates list of phases
  Widget phasesBuilder(
      List phase, List ects, int whichpase, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 40.w, right: 40.w),
      child: SizedBox(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: phase.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 20 / 15,
            ),
            itemBuilder: (context, index) {
              return categoryWidget(phase, ects, index, whichpase,
                  context: context);
            }),
      ),
    );
  }

  /// category item builder widget
  Widget categoryWidget(List phase, List ects, int index, int whchpase,
      {var context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (whchpase == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPageECONOMIA(
                        'FASEI',
                        phaseslongname[phase[index]],
                        ects[index],
                        fasei[index])));
          } else if (whchpase == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPageECONOMIA(
                        'FASEII',
                        phaseslongname[phase[index]],
                        ects[index],
                        faseii[index])));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectPageECONOMIA(
                        'FASEIII',
                        phaseslongname[phase[index]],
                        ects[index],
                        faseiii[index])));
          }
        },
        child: Container(
          height: 30.h,
          width: 70.w,
          color: Colors.red[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h),
                child: Text(
                  phase[index],
                  style: bold16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 80.w, bottom: 5.h),
                child: Text(
                  ects[index],
                  style: bold16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
