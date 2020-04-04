import 'Employee.dart';

class Director extends Employee{

  Director(String newName, String newDesig, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, String newDep):
  super(newName, newDesig, newId, newAge,newGender, newAdd, newSalary, newNo, newBoss, newDep);
  
}