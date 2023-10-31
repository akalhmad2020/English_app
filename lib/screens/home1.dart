
import 'package:english_app/english_db.dart';
import 'package:english_app/screens/add_new_word.dart';
import 'package:english_app/screens/another_words.dart';
import 'package:english_app/screens/exam.dart';
import 'package:english_app/screens/saved_words.dart';
import 'package:english_app/screens/words.dart';
import 'package:flutter/material.dart';


import '../widget/cardpart.dart';
import '../widget/sections.dart';

class Home1 extends StatefulWidget {




  const Home1({
    Key? key,
  }) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

List number = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
];
List icon = [Icons.favorite_rounded, Icons.add_box, Icons.star, Icons.quiz];
List titel = [
  "الكلمات التي تم حفظها",
  "أضف كلمة جديدة",
  "ذكرني لاحقاً",
  "إختبار"
];

class _Home1State extends State<Home1> {

  EnglishDb db = EnglishDb();


  _Home1State();


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.2,
              color: Color(0xFF20202D),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                color: Color(0xFF2F2F42),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.1,
                  padding: EdgeInsets.only(top: 30, bottom: 1),
                  child: Column(
                    children: [
                    const  Text('''الألف كلمة ''',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          )),
                      const    Text('''الأكثر إستعمالاً في الإنجليزية''',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          )),
                      const  SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Words(groupNumber: index,)));
                                },
                                child: cardpart(
                                  context: context,
                                  number: number[index],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.50,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,

                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2),
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () async {
                          if(i == 0){

                            Navigator.push(context, MaterialPageRoute(builder: (_)=>   SavedWards()));
                          } else  if(i == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>    AddNewWord()));
                          }else  if(i == 2){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>  const  AnotherWordsScreen()));
                          } else  if(i == 3){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>    Exam()));
                          }
                        },
                        child: Sections(
                          icon: icon[i],
                          titel: titel[i],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

}
