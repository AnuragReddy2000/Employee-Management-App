import 'Employee.dart';

class VicePresident extends Employee{

  VicePresident(String newName, String newDesig, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss):
  super(newName, newDesig, newId, newAge,newGender, newAdd, newSalary, newNo, newBoss, 'None');  
  
}