import 'package:CompanyDatabase/Models/Employee.dart';

class Developer extends Employee{
  String domain;
  String team;
  
  Developer(String newName, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, this.team, String newDep, this.domain):
  super(newName, 'Developer', newId, newAge,newGender, newAdd, newSalary, newNo, newBoss, newDep);  
}