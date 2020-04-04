import 'package:CompanyDatabase/Widgets/EmployeeForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePage extends StatelessWidget{
  final bool editEnable;
  final List<String> values;
  final String type;
  final String title;
  CreatePage({this.editEnable,this.values,this.type,this.title});

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(35, 255, 255, 255),
        elevation: 0.0,
        title: Text(title,textAlign: TextAlign.left ,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 23, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5)),),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery. of(context). size. height,
              width: MediaQuery. of(context). size. width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Colors.redAccent[700], Colors.blue]
                )
              ),
            ),
            EmployeeForm(editEnable: editEnable,values: values,type: type,),
          ],
        )
      )
    );
  }
}