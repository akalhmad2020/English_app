

import '../../screens/home1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تحدي الألف كلمة',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Color(0xFF393939),
            ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'),
      ],
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  color: Color(0xFF20202D),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("assets/images/books.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('''اللغة الإنجليزية للمبتدئين ''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.666,
              decoration: BoxDecoration(
                color: Color(0xFF20202D),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.666,
              padding: EdgeInsets.only(top: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'كل مجموعة تحتوي على عشر كلمات إحفظ مجموعة يومياً سوف تنهي التحدي بمئة يوم',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17, color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: Color(0xFF20202D),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home1(),
                            ));
                      },
                      child: Container(
                        padding:
                           const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                        child: const Text(
                          "إبدأ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
