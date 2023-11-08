
import 'package:english_app/screens/result.dart';
import 'package:english_app/widget/question.dart';
import 'package:flutter/material.dart';






class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Exam createState() => _Exam();
}

class _Exam extends State<Exam> {
  // Sample list of questions and options

  int result = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'ما هو الشكل الصحيح لكلمة كلب',
      'options': ['Dogs', 'doge', 'dog', 'dag'],
    },
    {
      'question': 'ما هو الرقم ستة',
      'options': ['4', '2', '1', '6'],
    },
    {
      'question': 'من اكبر 6 او 9',
      'options': ['6', '9', 'both', 'non'],
    },
  ];

  // You can put any options here.
  List<String> selectedOptions = ['Dogs' , '4' , '6'];
  // You must to write right answers.
  List<String> rightAnswers = ['dog' , '6' , '9'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20202D),
      appBar: AppBar(elevation: 0 ,
        title: const Text('امتحان'),
        backgroundColor: Colors.transparent,),

      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Q${index + 1}: ${questions[index]['question']}'),
                  const SizedBox(height: 10),
                  Column(
                    children: questions[index]['options'].map<Widget>((option) {
                      return RadioListTile(
                        title: Text(option),
                        value: option,
                        groupValue: selectedOptions[index],
                        onChanged: (value) {
                          setState(() {
                            selectedOptions[index] = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          for (int i = 0; i < questions.length; i++) {
            if(selectedOptions[i] == rightAnswers[i]){
              result++;
            }
          }
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Result(result: result)));
        },
        child: Icon(Icons.check),
      ),
    );
  }
}















//
// class Exam extends StatefulWidget {
//   const Exam({super.key});
//
//   @override
//   State<Exam> createState() => _ExamState();
// }
//
// class _ExamState extends State<Exam> {
//
//   bool gV = true ;
//   bool? firstV  ;
//   bool? secondV  ;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF20202D),
//       appBar: AppBar(elevation: 0 , backgroundColor: Colors.transparent,),
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           child: ListView.builder(
//               itemCount: 10,
//               shrinkWrap: true,
//               itemBuilder: (c,i){
//                 return Question(f: (x){
//
//                     setState(() {
//                       print('******** $x');
//                     firstV = true ;
//                    secondV = false ;
//                     });
//
//                 },);
//           }),
//         ),
//       ),
//     ) ;
//
//   }
// }




















// import 'dart:math';
//
// import 'package:english_app/screens/result.dart';
// import 'package:english_app/widget/model.dart';
// import 'package:english_app/widget/question.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
//
//
// class Exam extends StatefulWidget {
//   const Exam({super.key});
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _Exam createState() => _Exam();
// }
//
// class _Exam extends State<Exam> {
//   // Sample list of questions and options
//
//   int result = 0;
//   List<Map<String, dynamic>> questions = [];
//
//   // You can put any options here.
//   List<String> selectedOptions = ['صح' , 'خطا'];
//   // You must to write right answers.
//
//   List<Model> models = [];
//
//   @override
//   Widget build(BuildContext context) {
//
//     createQuestions();
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF20202D),
//       appBar: AppBar(elevation: 0 ,
//         title: const Text('امتحان'),
//         backgroundColor: Colors.transparent,),
//
//       body: ListView.builder(
//         itemCount: questions.length,
//         itemBuilder: (context, index) {
//
//
//
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Q${index + 1}: ${questions[index]['question']}'),
//                   const SizedBox(height: 10),
//                   Column(
//                     children: questions[index]['options'].map<Widget>((option) {
//                       return RadioListTile(
//                         title: Text(option),
//                         value: option,
//                         groupValue: 'صح',
//                         onChanged: (value) {
//
//                           setState(() {
//                             // if(index%2 == 0){
//                             //   result++;
//                             // }
//
//                             // selectedOptions[index] = value;
//                           });
//                         },
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//
//           for (int i = 0; i < questions.length; i++) {
//             if(i%2 == 0){
//               result++;
//             }
//           }
//           Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Result(result: result)));
//         },
//         child: Icon(Icons.check),
//       ),
//     );
//   }
//
//   void createQuestions() async{
//
//     SharedPreferences shared = await SharedPreferences.getInstance();
//
//     List<int> listsFinishedNumbers = [];
//
//     for(int i = 0 ; i < 20 ; i++){
//
//     if(shared.getBool('${i}group') == true){
//       listsFinishedNumbers.add(i);
//     }
//     }
//
//
//
//     for (int listNumber in listsFinishedNumbers) {
//       switch(listNumber){
//         case 0 :
//           models.add(listdata1[Random().nextInt(10)]);
//           models.add(listdata1[Random().nextInt(10)]);
//           break;
//         case 1 :
//           models.add(listdata2[Random().nextInt(10)]);
//           models.add(listdata2[Random().nextInt(10)]);
//           break;
//         case 2 :
//           models.add(listdata3[Random().nextInt(10)]);
//           models.add(listdata3[Random().nextInt(10)]);
//           break;
//         case 3 :
//           models.add(listdata4[Random().nextInt(10)]);
//           models.add(listdata4[Random().nextInt(10)]);
//           break;
//       }
//
//     }
//
//    for(int i=0 ; i<models.length; i++){
//
//      if(i%2 == 0){
//        questions.add(
//            {
//              'question': ' ${models[i].arabic} تعني ${models[i].english}',
//              'options': ['صح' , 'خطا'],
//            }
//
//        );
//      } else {
//       if(i == 0){
//         questions.add(
//             {
//               'question': ' ${models[i+1].arabic} تعني ${models[i].english}',
//               'options': ['صح' , 'خطا'],
//             }
//         );
//       } else if(i == models.length){
//         questions.add(
//             {
//               'question': ' ${models[i-1].arabic} تعني ${models[i].english}',
//               'options': ['صح' , 'خطا'],
//             }
//         );
//       } else if (i != models.length || i != 0){
//
//         questions.add(
//             {
//               'question': ' ${models[i-1].arabic} تعني ${models[i].english}',
//               'options': ['صح' , 'خطا'],
//             }
//         );
//
//       }
//      }
//
//
//    }
//   }
//
//
//
// }
//
//
//
//
//
//
//
//
//
