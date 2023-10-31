import 'package:flutter/material.dart';

class cardpart extends StatelessWidget {
  const cardpart({
    super.key,
    required this.context,
    required this.number,
  });

  final BuildContext context;

  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: Color(0xFF20202D),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("المجموعة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                )),
            Text(
              number.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.check_circle,
              color: Colors.black,
              size: 20.0,
            ),
          ],
        ),
      ),
      padding: EdgeInsets.only(right: 5, left: 5),
    );
  }
}
