import 'package:CompanyDatabase/Models/ServerUtil.dart';
import 'package:CompanyDatabase/Widgets/Demographics.dart';
import 'package:CompanyDatabase/Widgets/StartPageButtons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CreatePage.dart';
import 'SearchPage.dart';

class HomePage extends StatefulWidget{
  final String title;
  HomePage({Key key, this.title}): super(key: key);

  @override 
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<int> data;

  void getData()async {
    data = await ServerUtil.getCount();
    setState(() => {
      isLoading = false,
    });
  }

  void create() async {
    String result = await Navigator.push(context,MaterialPageRoute(builder: (context) => CreatePage(title: 'Create Profile',editEnable: true,values: ['','',null,null,'','','','','',null,'',''],type: 'create',)));
    if (result == 'submitted'){
      isLoading = true;
      getData();
    }
  }

  void search() async {
    Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage(editEnable: false,isDelete: false,title: 'Search Profiles',)));
  }

  void delete() async {
    Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage(editEnable: true,isDelete: true,title: 'Delete Profile',detailsRefresh: getData,)));
  }

  void edit() async {
    Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage(editEnable: true,isDelete: false,title: 'Edit Profile',)));
  }


  @override 
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(35, 255, 255, 255),
        elevation: 0.0,
        title: Text(widget.title, style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 23, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5)),),
      ),
      body: Center(
        child:Stack(children: <Widget>[
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(20, 255, 255, 255),
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: kToolbarHeight + 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Employee Demographics:',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(textStyle: TextStyle(decoration: TextDecoration.underline,fontSize: 30), color: Color.fromARGB(255, 0, 14, 45),decorationThickness: 10)      
                      ),
                      isLoading ? Container(
                        padding: EdgeInsets.only(top: 40,),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(backgroundColor: Colors.transparent,valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),),
                        ) : Demographics(data: data,)
                    ],
                  )
                ),
                Expanded(child: StartPageButtons(create: create,edit: edit,delete: delete,search: search,),)
            ],
          ),
        ],
        )
      ),
    );
  }
}

