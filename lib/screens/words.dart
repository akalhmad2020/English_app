
import 'package:english_app/english_db.dart';
import 'package:flutter/material.dart';

import '../widget/model.dart';
import 'home1.dart';
import 'kwords.dart';

class Words extends StatefulWidget {
  const Words({super.key , required this.groupNumber});

  final int groupNumber;
  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words> {

  Color color = Colors.grey;

  EnglishDb db = EnglishDb();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF20202D),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.07,
                    right: MediaQuery.of(context).size.width * 0.4,
                  ),
                  child:   Text(
                    " المجموعة رقم  ${widget.groupNumber +1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {

                        switch(widget.groupNumber) {


                          case 0 :
                          return kwords(
                            pro: listdata1[index],
                            number: number[index],

                          ) ;


                          case 1 :  return kwords(
                            pro: listdata2[index],
                            number: number[index],

                          ) ;



                          case 2 :  return kwords(
                            pro: listdata3[index],
                            number: number[index],

                          ) ;



                          case 3 :  return kwords(
                            pro: listdata4[index],
                            number: number[index],
                          ) ;

                          case 4 :  return kwords(
                            pro: listdata5[index],
                            number: number[index],
                          ) ;


                          case 5 :  return kwords(
                            pro: listdata6[index],
                            number: number[index],
                          ) ;


                          case 6 :  return kwords(
                            pro: listdata7[index],
                            number: number[index],
                          ) ;

                          case 7 :  return kwords(
                            pro: listdata8[index],
                            number: number[index],
                          ) ;

                          case 8 :  return kwords(
                            pro: listdata9[index],
                            number: number[index],
                          ) ;

                          case 9 :  return kwords(
                            pro: listdata10[index],
                            number: number[index],
                          ) ;






                        }

                        return const SizedBox();
                      }),
                ),
              ],
            )),
      ),
    );
  }





}
