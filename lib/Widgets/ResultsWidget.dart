import 'package:CompanyDatabase/Models/ServerUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsWidget extends StatelessWidget{
  final List<String> data;
  final Function nextPage;
  final bool isDelete;
  final Function refresh;  
  ResultsWidget({this.data,this.nextPage,this.isDelete = false,this.refresh});

  void alertBox(BuildContext context) async {
    Function f = await showDialog(context: context,
      builder: (_) => AlertDialog(
        title: Text('Delete Confirmtion'),
        content: Text('Do you wish to delete the following profile?'),
        actions: <Widget>[
          FlatButton(onPressed: (){Navigator.pop(context,(){});}, child: Text('No')),
          FlatButton(onPressed: () {ServerUtil.delete(data[1]);Navigator.pop(context,refresh);}, child: Text('Yes')),
        ],
      ),
      barrierDismissible: true,
    );
    f();
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap:(){
        isDelete ? alertBox(context) : nextPage(data);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(20, 255, 255, 255),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Icon(Icons.account_box,color: Color.fromARGB(255, 0, 14, 45),size: 68.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data[0],
                  textAlign: TextAlign.left,
                  style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 25, color: Colors.black,decorationThickness: 10)),
                ),
                Text(data[2],
                  textAlign: TextAlign.left,
                  style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 18, color: Colors.black87,decorationThickness: 10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}