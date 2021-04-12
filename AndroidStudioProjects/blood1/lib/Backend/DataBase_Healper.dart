
import '../UInfo_list.dart';

class Databasehelper{
      static final _databaseName = "MyDatabase.db";
      static final _databaseVersion = 1;

  Map<String, dynamic> toJson(UInfo_list uInfo_list) {
    final Map<String, dynamic> U_data = Map<String, dynamic>();
    U_data['name'] = uInfo_list.name;
    U_data['bloodgrope'] = uInfo_list.blood_grope;
    U_data['age'] = uInfo_list.age;
    U_data['gmail'] = uInfo_list.gmail;
    U_data['weight'] = uInfo_list.weight;
    U_data['last_donation_time'] =uInfo_list.last_donation_time;
    return U_data;
  }


}