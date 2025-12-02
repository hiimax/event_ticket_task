
import 'package:event_ticket_task/app/router.dart';
import 'package:event_ticket_task/core/utils/toast_util.dart';
import 'package:flutter/foundation.dart';

class BaseChangeNotifier extends ChangeNotifier {
  BaseChangeNotifier() {}

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void log(Object? e) {
    if (kDebugMode) log(e.toString());
  }

  void handleError({String? message, Object? error}) {
    setLoading(false);
    rootNavigatorKey.currentContext!.showErrorMessage(message: message ?? '');
  }
}
