import 'package:CompanyDatabase/Models/ServerUtil.dart';
import 'package:CompanyDatabase/Widgets/AdditonalForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CommonForm.dart';

class EmployeeForm extends StatefulWidget{
  final bool editEnable;
  final List<String> values;
  final String type;
  EmployeeForm({this.editEnable,this.values,this.type});

  @override 
  EmployeeFormState createState() => EmployeeFormState(desig: values[2]);
}

class EmployeeFormState extends State<EmployeeForm>{
  final _formKey = GlobalKey<FormState>();
  String desig;
  List<String> employeeData = List<String>(12);
  bool submitState = true;
  String state;
  bool notFilled = true;
  EmployeeFormState({this.desig});

  void getDesig(String newDesig){
    setState(() {
      desig = newDesig;
    });
  }

  void setData(int index, String value){
    employeeData[index] = value;
  }

  void validateSave() async {
    state = await ServerUtil.sendFile(employeeData,widget.type);
    setState(() {
      submitState = false;
      submit();
    });
  }

  void submit(){
    if(submitState == true) {
      showDialog(
       context: context, 
        builder: (_) => AlertDialog(
          title: Column(
            children: <Widget>[
              Text('Please wait',style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5))),
              Container(
                padding: EdgeInsets.only(top: 5,),
                alignment: Alignment.center,
                child: CircularProgressIndicator(backgroundColor: Colors.transparent,valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),),
              )
            ],
          ),
        ),
        barrierDismissible: true,
      ); 
    }
    else {
      if(state == 'success'){
        Navigator.pop(context);
        if(widget.type == 'edit'){
          Navigator.pop(context, "done");
        }
        else{
          Navigator.pop(context, "submitted");
        }
      }
      else if(state == 'fail'){
        showDialog(
          context: context, 
          builder: (_) => AlertDialog(
            title: Text('Sorry!, something is not right at the moment. Please try again later!',style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 14, 45), decorationThickness: 5))),
            backgroundColor: Colors.white70,
          ),
          barrierDismissible: true,
        );
      }
    }
  }

  @override 
  Widget build(BuildContext context){
      return Form(
        key: this._formKey,  
        child: ListView(
          padding: EdgeInsets.only(top: kToolbarHeight+10,),
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Column(
                children: 
                  CommonForm.getCommonForm(getDesig,widget.editEnable,setData,widget.values,(widget.type == 'create')) + 
                  AdditionalForm.getAdditional(desig,widget.editEnable,setData,widget.values) + 
                  [ 
                    widget.editEnable ? Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(top:5,bottom: 10,left:10,right: 10),
                      color: Colors.transparent,
                      child: RaisedButton(
                        color: Color.fromARGB(20, 255, 255, 255),
                        child: Text('Submit',style: GoogleFonts.josefinSans(textStyle: TextStyle(fontSize: 20, color: Colors.black,decorationThickness: 10)),),
                        onPressed: () {
                          if (this._formKey.currentState.validate()){
                            setState(() {
                              this._formKey.currentState.save();
                              validateSave();
                            });
                            submit();
                          }
                        },
                      ),
                    ) : Container(
                      color: Colors.transparent,
                    ),
                  ]
              ),
            ),
          ],
        )
      );
  }
}

