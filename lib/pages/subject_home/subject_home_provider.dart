import 'package:flutter/widgets.dart';

class SubjectHomeProvider with ChangeNotifier {
  Map<String, dynamic>? _currentSubject;

  Map<String, dynamic>? get currentSubject => _currentSubject;

  void setCurrentSubject(Map<String, dynamic> subject) {
    _currentSubject = subject;
    notifyListeners();
  }
}
