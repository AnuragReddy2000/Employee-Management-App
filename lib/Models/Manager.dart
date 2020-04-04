import 'dart:core';
import 'Employee.dart';

class Manager extends Employee {
	List <String> team = List();
	
	Manager(String newName, String newDesig, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, this.team, String newDep): 
  super(newName, newDesig, newId, newAge,newGender, newAdd, newSalary, newNo, newBoss, newDep);
	
}