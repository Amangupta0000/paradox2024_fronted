import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    return token;
  }
   
  
}
