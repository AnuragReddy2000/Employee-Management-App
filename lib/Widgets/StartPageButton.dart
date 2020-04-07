import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPageButton extends StatelessWidget{
  final String text;
  final IconData icon;
  StartPageButton(this.icon,this.text);

  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(color: Color.fromARGB(20, 255, 255, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,color: Color.fromARGB(255, 0, 14, 45),size: 80.0),
            Text(text, textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 25)),)
          ],
        ),
    );
  }
}