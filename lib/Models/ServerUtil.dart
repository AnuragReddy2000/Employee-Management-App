import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerUtil {
  static const TIMEOUT = 5;
  static String ip = '192.168.43.132';

  static Map<String, String> makeFile(List<String> input){
    Map<String, String> result = 
    {
        'name': input[0],
        'designation': input[2],
        'id': input[1],
        'age': input[4],
        'gender': input[3],
        'address': input[5],
        'salary':input[6],
        'phoneno':input[7],
        'boss':input[8],  
      };

    if (input[9] != null){
      result['department'] = input[9];
      if(input[10] != null){
        result['teams'] = input[10];
        if(input[11] != null){
          result['domain'] = input[11];
        }
      }
    }
    return result;
  }

  static Future<String> sendFile(List<String> input,String type) async{
    if (type == 'create'){
      http.Response response = await http.post('http://'+ ip +':3000/create',body: makeFile(input)).catchError((err){print(err);}).timeout(Duration(seconds: TIMEOUT));
      if(response == null){
        return 'Fail';
      }
      else{
        return 'success';
      }
    }
    else if (type == 'edit'){
      http.Response response = await http.post('http://'+ ip +':3000/edit',body: makeFile(input)).catchError((err){print(err);}).timeout(Duration(seconds: TIMEOUT));
      if(response == null){
        return 'Fail';
      }
      else{
        return 'success';
      }
    }
  }

  static  Future<List<List<String>>> getData(String name) async{
    http.Response response = await http.get('http://'+ ip +':3000/view/'+name)
      .timeout(Duration(seconds: TIMEOUT))
      .catchError((err) {
        print(err);
      } 
    );
    if (response == null){
      return [['serverdown']];
    }
    List<dynamic> responseBody = json.decode(response.body);
    List<List<String>> data = List<List<String>>();
    for(var i=0; i < responseBody.length; i++){
      List<String> singleData = List<String>(12);
      singleData[0] = responseBody[i]['Name'];
      singleData[1] = responseBody[i]['Id'].toString();
      singleData[2] = responseBody[i]['Designation'];
      singleData[3] = responseBody[i]['Gender'];
      singleData[4] = responseBody[i]['Age'].toString();
      singleData[5] = responseBody[i]['Address'];
      singleData[6] = responseBody[i]['Salary'].toString();
      singleData[7] = responseBody[i]['PhoneNo'].toString();
      singleData[8] = responseBody[i]['Boss'];
      singleData[9] = responseBody[i]['Department'];
      (responseBody[i]['Teams'] == null) ? singleData[10] = '' : singleData[10] = responseBody[i]['Teams'].toString();
      (responseBody[i]['Domain'] == null) ? singleData[11] = '' : singleData[11] = responseBody[i]['Domain'].toString();
      data.add(singleData);
    }
    return data;
  }

  static void delete(String id) async{
    await http.post('http://'+ ip +':3000/delete/'+id).catchError((err){print(err);});
  }

  static Future<List<int>> getCount() async {
    http.Response response = await http.get('http://'+ ip +':3000/count')
      .timeout(Duration(seconds: TIMEOUT))
      .catchError((err) {
        print(err);
      }
    );
    if (response == null) {
      return [-1];
    }
    List<dynamic> responseBody = json.decode(response.body);
    List<int> data = List<int>(6);
    data = [0,0,0,0,0,0];
    for(var i=0; i<responseBody.length; i++){
      if(responseBody[i]['Designation'] == 'Vice President'){
        data[0]++;
      }
      else if(responseBody[i]['Designation'] == 'Product Director'){
        data[1]++;
      }
      else if(responseBody[i]['Designation'] == 'Engineering Director'){
        data[2]++;
      }
      else if(responseBody[i]['Designation'] == 'Product Manager'){
        data[3]++;
      }
      else if(responseBody[i]['Designation'] == 'Engineering Manager'){
        data[4]++;
      }
      else if(responseBody[i]['Designation'] == 'Developer'){
        data[5]++;
      }
    }
    return data;
  }
}
