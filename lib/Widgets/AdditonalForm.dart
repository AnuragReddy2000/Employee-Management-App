import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DropDowns.dart';
import 'FormFields.dart';

class AdditionalForm{

  static List<Widget> getAdditional(String desig, bool editEnable,Function valueset,List<String> values){
    if(desig == 'Developer'){
      return [
        DropDowns(type: 'Department',def: values[9],options: ['Engineering','Products'],callBack: (String x){},editEnable: editEnable,valueSet: valueset,index: 9,),
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: FormFields(type: 'Team',def: values[10],right: 5,enable: editEnable,callBack: valueset,index: 10,),
            ),
            Flexible(
              flex: 1,
              child: FormFields(type: 'Domain',def: values[11],left: 5,enable: editEnable,callBack: valueset,index: 11,),
            ),
          ],
        ),
      ];
    }

    else if(desig == 'Engineering Manager' || desig == 'Product Manager'){
      return [
        DropDowns(type: 'Department',def: values[9],options: ['Engineering','Products'],callBack: (String x){},editEnable: editEnable,valueSet: valueset,index: 9,),
        FormFields(type: 'Teams',def: values[10],enable: editEnable,callBack: valueset,index: 10,),
      ];
    }

    else if(desig == 'Vice President' || desig == null){
      return [];
    }

    else{
      return [
        DropDowns(type: 'Department',def: values[9],options: ['Engineering','Products'],callBack: (String x){},editEnable: editEnable,valueSet: valueset,index: 9,),
      ];
    }
  }
}