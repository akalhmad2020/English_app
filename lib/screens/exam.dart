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
      'question': 'What is the correct way to write dog?',
      'options': ['Dogs', 'doge', 'dog', 'dag'],
    },
    {
      'question': 'What comes after 5 number?',
      'options': ['4', '2', '1', '6'],
    },
    {
      'question': 'What is grater 9 or 6?',
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
