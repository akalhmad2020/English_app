import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cardpart extends StatefulWidget {
    cardpart({
    super.key,
    required this.context,
    required this.number,


  });

  final BuildContext context;

  final int number;

  @override
  State<cardpart> createState() => _cardpartState();
}

class _cardpartState extends State<cardpart> {

  @override
  void initState(){
    setValue();
    super.initState();
  }
  bool? isFinished   ;
  @override
  Widget build(BuildContext context) {

    setValueToIsFinished();

    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child:   Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
          color: Color(0xFF20202D),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const  Text("المجموعة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                )),
            Text(
              widget.number.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            InkWell(
              onTap: () async{

                SharedPreferences shared = await  SharedPreferences.getInstance() ;

                print('${shared.getBool('${widget.number}group')}');
                 if(shared.getBool('${widget.number}group') == true){
                  shared.setBool('${widget.number}group', false);
                  isFinished =  shared.getBool('${widget.number}group');

                } else if(shared.getBool('${widget.number}group') == false){
                  shared.setBool('${widget.number}group', true);
                  isFinished =  shared.getBool('${widget.number}group');
                }
                 setState(() {
                   print(isFinished);
                 });

               },
              child: Icon(
                Icons.check_circle,
                color: isFinished == true ? Colors.greenAccent : Colors.black ,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future setValue () async{
    SharedPreferences shared = await  SharedPreferences.getInstance() ;

    if(shared.getBool('${widget.number}group') == null){
      shared.setBool('${widget.number}group', false);
       }


  }

   void setValueToIsFinished () async{
    SharedPreferences shared = await  SharedPreferences.getInstance() ;


  setState(() {
    isFinished  =   shared.getBool('${widget.number}group');
  });

  }
}
