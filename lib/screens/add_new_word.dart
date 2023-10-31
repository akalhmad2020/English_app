

import 'package:english_app/english_db.dart';
import 'package:flutter/material.dart';

class AddNewWord extends StatelessWidget {
    AddNewWord({super.key});

  TextEditingController enC = TextEditingController();
  TextEditingController arC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    EnglishDb englishDb = EnglishDb();
    return Scaffold(
      backgroundColor: const Color(0xFF20202D),
      appBar: AppBar(elevation: 0 , backgroundColor: Colors.transparent,),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child:   Column(

          children: [
            const   SizedBox(height: 40,),
            TextField(
              controller: enC,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ادخل الكلمة الانجليرية',
                  suffixIcon:   Icon(Icons.search),
                  contentPadding:   EdgeInsets.only(left: 20 , bottom: 5 , right: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:   BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:   BorderSide(color: Colors.white)
                  )
              ),
            ),
            const   SizedBox(height: 40,),
               TextField(
              controller: arC,
              decoration:  const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ادخل الترجمة العربية اذا وجدت',
                  suffixIcon:   Icon(Icons.search),
                  contentPadding:   EdgeInsets.only(left: 20 , bottom: 5 , right: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:   BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:   BorderSide(color: Colors.white)
                  )
              ),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(onPressed: ()async{

         if(enC.text.isNotEmpty){
           int x = await  englishDb.insertWord(englishWord: enC.text, arabicWord: arC.text, image: '', sound: '', id: 0 );

           if(x != -1){
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('تم اضافة الكلمة'))
             );
             Navigator.of(context).pop();
           }

         }else {
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text('ادخل الكلمة الانجليزية'))
           );
         }

            }, child: const Text('احفظ')),
          ],
        ),
      ),
    );
  }
}
