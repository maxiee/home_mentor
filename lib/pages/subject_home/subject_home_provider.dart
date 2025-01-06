import 'package:flutter/widgets.dart';
import 'package:home_mentor/services/subject_service.dart';

class SubjectHomeProvider with ChangeNotifier {
  Map<String, dynamic>? _currentSubject;

  Map<String, dynamic>? get currentSubject => _currentSubject;

  void setCurrentSubject(Map<String, dynamic> subject) {
    _currentSubject = subject;
    notifyListeners();
  }

  Future<void> updateBackground(String background) async {
    _currentSubject!['background'] = background;
    await subjectServiceUpdateBackground(_currentSubject!['id'], background);
    notifyListeners();
  }
}
