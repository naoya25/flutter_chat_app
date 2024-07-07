import 'package:firebase_analytics/firebase_analytics.dart';

void logEvent(String name) {
  FirebaseAnalytics.instance.logEvent(name: name);
}
