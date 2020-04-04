import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFields extends StatelessWidget{
  final String type;
  final String def;
  final double left;
  final double right;
  final bool enable;
  final Function callBack;
  final int index;
  FormFields({this.type,this.def = ' ',this.left = 10,this.right = 10,this.enable=true,this.callBack,this.index});
  
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(20, 255, 255, 255),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: left, right: right,top: 5 ,bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(type+':  ',style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 20, color: Colors.black,decorationThickness: 10)),),
          ),
          TextFormField(
            initialValue: def,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.black),
            ),
            enabled: enable,
            onSaved: (value) => callBack(index,value),
            validator: (value) => value.isEmpty ? 'This field must be filled' : null,
          ),
        ]
      ),
    );
    
  }
}