import 'package:shared_preferences/shared_preferences.dart';

class FreeLimitService {
  static Future<int> getRemainingFreeLimit() async {
    // Implement logic to track the number of posts viewed for the day
    // You may use shared preferences or any other storage mechanism for this.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int postsViewed = prefs.getInt('postsViewed') ?? 0;
    return 20 - postsViewed;
  }

  static Future<void> incrementPostsViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int postsViewed = prefs.getInt('postsViewed') ?? 0;
    prefs.setInt('postsViewed', postsViewed + 1);
  }
}
