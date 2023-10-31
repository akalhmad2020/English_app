
import 'package:audioplayers/audioplayers.dart';
import 'package:english_app/another_words.dart';
import 'package:english_app/english_db.dart';
import 'package:flutter/material.dart';

class SavedWards extends StatefulWidget {


    SavedWards({super.key  } );

  @override
  State<SavedWards> createState() => _SavedWardsState();
}

class _SavedWardsState extends State<SavedWards> {
  AnotherWords anotherWords = AnotherWords();
  int insertedAnotherWord = -1  ;
  EnglishDb englishDb = EnglishDb();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: const Color(0xFF20202D),
      appBar: AppBar(elevation: 0 , backgroundColor: Colors.transparent,),
      body:   SafeArea(
        child: FutureBuilder( future: englishDb.readWords(), initialData: [] ,  builder: (c,snapshot){

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator while data is being fetched.
        } else {
          final dataList = snapshot.data;


          return ListView.builder(
              itemCount: dataList!.length,

              itemBuilder: (c,i){



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
                                  image: AssetImage(dataList[i]['image']),
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
                                dataList[i]['en_word'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                dataList[i]['ar_word'],
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

                                                const    SizedBox(
                                                  width: 3,
                                                ),
                                                InkWell(
                                                  onTap: ()async{
                                                 int deletedRwa =    await  englishDb.deleteWord(en_word: dataList[i]['en_word']);
                                                 if(deletedRwa != -1){
                                                 setState(() {
                                                   ScaffoldMessenger.of(context).showSnackBar
                                                     (SnackBar(content: Text('تم الحذف')));
                                                 });
                                                 }

                                                  },
                                                  child: const Text(
                                                    "احذف ",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    ),
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
                                                // Icon(
                                                //   Icons.star,
                                                // ),
                                              const  SizedBox(
                                                  width: 3,
                                                ),
                                                InkWell(
                                                  onTap:()async{
                                                    bool isFound  =    await  anotherWords.searchWord(en_word: dataList[i]['en_word']);

                                                    if(isFound){
                                                      int x=    await  anotherWords.deleteWord(en_word: dataList[i]['en_word']);

                                                      if(x != -1){
                                                        setState(() {
                                                          insertedAnotherWord = -1 ;
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(content: Text('تمت ازالتها'))
                                                          );

                                                        });
                                                      }
                                                    }else {
                                                      int x=    await  anotherWords.insertWord(arabicWord: dataList[i]['ar_word'] , englishWord: dataList[i]['en_word'] ,
                                                          image: dataList[i]['image'] , sound: dataList[i]['sound'] , id: dataList[i]['id_word']);

                                                      if(x != -1){
                                                        setState(() {
                                                          insertedAnotherWord = x ;
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(content: Text('تمت الاضافة للمذكرة')));
                                                        });
                                                      }
                                                    }
                                                  },
                                                  child: const Text(
                                                    "أضف للمذكرة",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    ),
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
                                                Source path = AssetSource(dataList[i]['sound']);
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
              });
        }

        },),
      ),
    );
  }
}
