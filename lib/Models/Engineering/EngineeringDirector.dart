import 'package:CompanyDatabase/Models/Director.dart';

class EngineeringDirector extends Director{

  EngineeringDirector(String newName, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, String newDep):
  super(newName, 'Engineering Director', newId, newAge,newGender, newAdd, newSalary, newNo, newBoss, newDep);
  
}