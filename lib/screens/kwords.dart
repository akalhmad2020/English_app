
import 'package:audioplayers/audioplayers.dart';
import 'package:english_app/another_words.dart';
import 'package:flutter/material.dart';

import '../english_db.dart';
import '../widget/model.dart';

class kwords extends StatefulWidget {
  final Model pro;
  final int number;


    kwords({super.key, required this.pro, required this.number  });

  @override
  State<kwords> createState() => _kwordsState();
}

class _kwordsState extends State<kwords> {
   int insertedWord = -1  ;
   int insertedAnotherWord = -1  ;

  EnglishDb db = EnglishDb();
  AnotherWords anotherWords = AnotherWords();

  @override
  void initState() {
   getColor();
   getAnotherColor();
    super.initState();
  }


  Future<void> getColor() async{
    bool isFound  =    await  db.searchWord(en_word: widget.pro.english);
    if(isFound){
    setState(() {
      insertedWord = 1 ;
    });
    }else {
      setState(() {
        insertedWord = -1 ;
      });
    }
  }

   Future<void> getAnotherColor() async{
     bool isFound  =    await  anotherWords.searchWord(en_word: widget.pro.english);
     if(isFound){
       setState(() {
         insertedAnotherWord = 1 ;
       });
     }else {
       setState(() {
         insertedAnotherWord = -1 ;
       });
     }
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        right: MediaQuery.of(context).size.height * 0.01,
        left: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
          color: Color(0xFF2F2F42),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              spreadRadius: 0.01,
              offset: Offset(0.25, -0.25),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(widget.pro.Img),
                    )),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.pro.english,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.pro.arabic,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.01,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F2F42),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF20202D),
                                      spreadRadius: 0.7,
                                      offset: Offset(-0.1, -0.1),
                                      blurStyle: BlurStyle.solid,
                                    ),
                                  ],
                                ),
                                child:  Row(
                                  children: [
                                     InkWell(
                                        onTap: ()async{

                                bool isFound  =    await  db.searchWord(en_word: widget.pro.english);

                              if(isFound){
                                int x=    await  db.deleteWord(en_word: widget.pro.english);

                             if(x != -1){
                            setState(() {
                              insertedWord = -1 ;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('تمت ازالتها'))
                              );

                            });
                             }
                              }else {
                                int x=    await  db.insertWord(arabicWord: widget.pro.arabic , englishWord: widget.pro.english ,
                                    image: widget.pro.Img , sound: widget.pro.mp3 , id: widget.pro.id);

                                if(x != -1){
                                  setState(() {
                                    insertedWord = x ;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('تمت الاضافة للمفضلة')));
                                  });
                                }
                              }
                                                 },
                                       child:  Icon(
                                        Icons.favorite_rounded,
                                      color:  insertedWord != -1 ? Colors.yellow : Colors.grey,

                                    ),
                                     ),
                                const    SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      "أضف للمفضلة",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F2F42),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF20202D),
                                      spreadRadius: 0.7,
                                      offset: Offset(-0.1, -0.1),
                                      blurStyle: BlurStyle.solid,
                                    ),
                                  ],
                                ),
                                child:   Row(
                                  children: [
                                    InkWell(
                                      onTap: () async{
                                        bool isFound  =    await  anotherWords.searchWord(en_word: widget.pro.english);

                                        if(isFound){
                                          int x=    await  anotherWords.deleteWord(en_word: widget.pro.english);

                                          if(x != -1){
                                            setState(() {
                                              insertedAnotherWord = -1 ;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('تمت ازالتها'))
                                              );

                                            });
                                          }
                                        }else {
                                          int x=    await  anotherWords.insertWord(arabicWord: widget.pro.arabic , englishWord: widget.pro.english ,
                                              image: widget.pro.Img , sound: widget.pro.mp3 , id: widget.pro.id);

                                          if(x != -1){
                                            setState(() {
                                              insertedAnotherWord = x ;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('تمت الاضافة للمذكرة')));
                                            });
                                          }
                                        }
                                      },
                                      child:  Icon(
                                        Icons.star,
                                        color: insertedAnotherWord != -1 ? Colors.yellow : Colors.grey,
                                      ),
                                    ),
                                const    SizedBox(
                                      width: 3,
                                    ),
                                  const  Text(
                                      "أضف للمذكرة",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Stack(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2F2F42),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF20202D),
                                      spreadRadius: 0.7,
                                      offset: Offset(-0.1, -0.1),
                                      blurStyle: BlurStyle.solid,
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    AudioPlayer player = AudioPlayer();
                                    Source path = AssetSource(widget.pro.mp3);
                                    player.play(path);
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "قراءة الكلمة",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: MediaQuery.of(context).size.height * 0.05,
                  //     left: MediaQuery.of(context).size.width * 0.03,
                  //   ),
                  //   child: Icon(
                  //     Icons.play_circle,
                  //     size: 40,
                  //     color: Colors.amber,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
