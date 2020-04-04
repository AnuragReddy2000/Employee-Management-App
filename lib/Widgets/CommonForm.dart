import 'package:flutter/cupertino.dart';
import 'DropDowns.dart';
import 'FormFields.dart';

class CommonForm {

  static List<Widget> getCommonForm(Function callBack,bool editEnable,Function valueSet,List<String> values,bool idEnable){
    return [
      FormFields(type: 'Name',def: values[0],enable: editEnable,callBack: valueSet,index: 0),
      FormFields(type:'Id',def: values[1],enable: idEnable,callBack: valueSet,index: 1,),
      DropDowns(type: 'Designation',def: values[2],options: ['Vice President','Product Director','Product Manager','Engineering Director','Engineering Manager','Developer'],callBack: callBack,editEnable: editEnable,valueSet: valueSet,index: 2,),
      DropDowns(type: 'Gender',def: values[3],options: ['Male','Female','Other'],callBack: (String x){},editEnable: editEnable,valueSet: valueSet,index: 3,),
      FormFields(type: 'Age',def: values[4],enable: editEnable,callBack: valueSet,index: 4,),
      FormFields(type: 'Address',def: values[5],enable: editEnable,callBack: valueSet,index: 5,),
      Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child:FormFields(type: 'Salary',def: values[6],right: 5,enable: editEnable,callBack: valueSet,index: 6,),
          ),
          Flexible(
            flex: 1,
            child: FormFields(type: 'Phone Number',def: values[7],left: 5,enable: editEnable,callBack: valueSet,index: 7,),
          ),
      ],
    ),
    FormFields(type: 'Reports To',def: values[8],enable: editEnable,callBack: valueSet,index: 8,),
    ];
  }
}