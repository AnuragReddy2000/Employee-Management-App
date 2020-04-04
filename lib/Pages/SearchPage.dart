import 'package:CompanyDatabase/Models/ServerUtil.dart';
import 'package:CompanyDatabase/Widgets/GetResults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CreatePage.dart';

class SearchPage extends StatefulWidget{
  final String title;
  final bool editEnable;
  final bool isDelete;
  final Function detailsRefresh;
  SearchPage({this.editEnable,this.isDelete,this.title,this.detailsRefresh});
  
  @override 
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>{
  bool isLoading = false;
  bool fetched = false;
  String _name;
  List<List<String>> data = [];

  void getData(String name) async{
    _name = name;
    setState(() => {
      fetched =false,
      isLoading = true,
    });
    List<List<String>> tempData = await ServerUtil.getData(name);
    setState(() => {
      fetched = true,
      data = tempData,
      isLoading = false,
    });
  }

  void refresh(){
    getData(_name);
    widget.detailsRefresh();
  }

  void nextPage(List<String> inp) async {
    String result = await Navigator.push(context,MaterialPageRoute(builder: (context) => CreatePage(title: widget.title,editEnable: widget.editEnable,values: inp,type: 'edit',),));
    if (result == 'done'){
      getData(_name);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(35, 255, 255, 255),
        elevation: 0.0,
        title: Text(widget.title,textAlign: TextAlign.left ,style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 23, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5)),),
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
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left:10,right:10,bottom:10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter name to '+widget.title,
                    ),
                    onSubmitted: (value) { (value == '') ? showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text('Please enter a name'),backgroundColor: Colors.white70,),
                        barrierDismissible: true,) : getData(value);}
                  ),
                ),
                isLoading ? Container(
                  padding: EdgeInsets.only(top: 200,left: (MediaQuery.of(context).size.width)/2-18,right: (MediaQuery.of(context).size.width)/2-18),
                  child: CircularProgressIndicator(backgroundColor: Colors.transparent,valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),),
                ) 
                : fetched ? GetResults(title: widget.title,data: data,editEnable: widget.editEnable,isDelete: widget.isDelete,nextPage: nextPage, refresh: refresh) 
                  : Container(margin: EdgeInsets.only(top: 100),color: Colors.transparent, alignment: Alignment.center,child: Icon(Icons.search,size: 150,color: Colors.black26,))
              ],
            ),
          ],
        ),
      ),
    );
  } 
}