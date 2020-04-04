import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ResultsWidget.dart';

class GetResults extends StatelessWidget{
  final List<List<String>> data;
  final bool editEnable;
  final bool isDelete;
  final String title;
  final Function nextPage;
  final Function refresh;
  GetResults({this.data,this.editEnable,this.isDelete,this.title,this.nextPage,this.refresh});

  @override 
  Widget build(BuildContext context){
    if(data.isEmpty == true){
      return Container(
        margin: EdgeInsets.only(top: 200),
        color: Colors.transparent,
        child: Text('Sorry, no employee by that name',
        style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 23, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5)),
        textAlign: TextAlign.center,
        ),
      );
    }
    else if(data[0][0] == 'serverdown'){
      return Container(
        margin: EdgeInsets.only(top: 200),
        color: Colors.transparent,
        child: Text('Sorry!, something is not right at this moment. Please come back later!',
        style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 23, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5)),
        textAlign: TextAlign.center,
        ),
      );
    }
    else{
      List<ResultsWidget> result = List();
      for (var i=0; i<data.length; i++){
        result.add(
          ResultsWidget(data: data[i],
            nextPage: nextPage,
            isDelete: isDelete,
            refresh: refresh,
          )
        );
      }
      return Column(children: result,);
    }
  }
}

