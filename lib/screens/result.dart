

import 'package:english_app/screens/exam.dart';
import 'package:english_app/screens/home1.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key , required this.result});
  final int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20202D),
      appBar: AppBar(elevation: 0 , backgroundColor: Colors.transparent,),

      body: SafeArea(

        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('اجاباتك الصحيحة من ٣ هي  $result' ,
              style: const TextStyle(
                fontWeight: FontWeight.bold ,
                fontSize: 24,
                color: Colors.white
              ),),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Home1()));
              }, child:const Text('الريسية')),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Exam()));
              }, child:const Text('اعدالامتحان '))
            ],
          ),
        ),
      ),
    );
  }
}
