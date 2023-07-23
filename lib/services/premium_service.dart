import 'package:shared_preferences/shared_preferences.dart';

class PremiumService {
  static Future<bool> isPremiumUser() async {
    // Implement logic to check if the authenticated user is a premium member
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isPremium') ?? false;
  }

  static Future<void> setPremiumUser(bool isPremium) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPremium', isPremium);
  }
}
