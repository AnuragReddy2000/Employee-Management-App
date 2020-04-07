import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Demographics extends StatelessWidget{
  final List<int> data;
  Demographics({this.data});

  @override
  Widget build (BuildContext context){
    return (data[0] == -1) ?  Container(
      margin: EdgeInsets.only(left: 10,right: 10, top: 30),
      alignment: Alignment.center,
      child: Text('Sorry!, something isn\'t right at this moment. Please come back later!',
        textAlign: TextAlign.center,
        style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17, color: Colors.black, decorationThickness: 10)),
      )
    )
    : Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10,left:15,right: 10,bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Vice Presidents:  '+data[0].toString() ,textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 10))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Product Directors:  '+data[1].toString(),textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 5))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Engineering Directors:  '+data[2].toString(),textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 5))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Product Managers:  '+data[3].toString(),textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 5))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Engineering Managers:  '+data[4].toString(),textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 5))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Developers:  '+data[5].toString(),textAlign: TextAlign.left,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 17*(MediaQuery.of(context).size.height /640), color: Colors.white, decorationThickness: 5))),
          ),
        ],
      ),
    );
  }
}