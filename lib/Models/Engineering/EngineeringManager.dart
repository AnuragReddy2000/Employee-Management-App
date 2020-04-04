import 'package:CompanyDatabase/Models/Manager.dart';

class EngineeringManager extends Manager{
  
  EngineeringManager(String newName, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, List<String> newTeam, String newDep):
  super(newName, 'Engineering Manager', newId, newAge,newGender, newAdd, newSalary, newNo, newBoss,newTeam, newDep);  
}