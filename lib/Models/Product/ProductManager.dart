import 'package:CompanyDatabase/Models/Manager.dart';

class ProductManager extends Manager{

  ProductManager(String newName, String newId,
		int newAge, String newGender, String newAdd, int newSalary,
		String newNo, String newBoss, List<String> newTeam, String newDep):
  super(newName, 'Product Manager', newId, newAge,newGender, newAdd, newSalary, newNo, newBoss,newTeam, newDep);

}