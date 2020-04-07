import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StartPageButton.dart';

class StartPageButtons extends StatelessWidget{
  final Function create;
  final Function search;
  final Function edit;
  final Function delete;
  StartPageButtons({this.create,this.search,this.edit,this.delete});

  @override 
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Row(  
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: (){
                      search();
                    },
                    child: StartPageButton(Icons.account_circle,'Search Profiles')
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: ()async {
                      create();
                    },
                    child: StartPageButton(Icons.add_circle_outline,'New Profile'),
                  )
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(bottom: 5,left: 5,right: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: (){
                      delete();
                    },
                    child: StartPageButton(Icons.delete_outline,'Delete Profile')
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      edit();
                    },
                    child: StartPageButton(Icons.edit,'Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}