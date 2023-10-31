
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
    Question({super.key   , required this.f});

    var f ;

  bool gV = true ;

  bool? firstV  ;

  bool? secondV  ;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {


  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: const EdgeInsets.all(16),
      height: 70,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(20)
      ),

      child: Row(
        children: [

          const Text('Whats is your name' , style: TextStyle(color: Colors.white),),
          const SizedBox(width: 20,),

          Radio(value: widget.firstV, groupValue: widget.gV, onChanged: widget.f),
          const SizedBox(width: 20,),
          Radio(value: widget.secondV, groupValue: widget.gV, onChanged: (x){
            setState(() {
              widget.firstV = false ;
              widget.secondV = true ;
            });
          })
        ],
      ),
    );
  }
}
