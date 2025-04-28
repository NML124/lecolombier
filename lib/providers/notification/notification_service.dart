import 'package:flutter/material.dart';

abstract class NotificationService {
  void show({required String title, required String body, required NotificationType type, IconData? icon});
  void showSuccess(String message);
  void showError(String message);
  void showWarning(String message);
}

enum NotificationType {
  success,
  error,
  warning,
}