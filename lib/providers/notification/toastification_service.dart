import '../../utils/materials.dart';

class ToastificationServiceImpl implements NotificationService {
  @override
  void show({required String title, required String body, required NotificationType type, IconData? icon}) {
    ToastificationType toastType;
    IconData? toastIcon = icon;

    switch (type) {
      case NotificationType.success:
        toastType = ToastificationType.success;
        toastIcon ??= Icons.check_box;
        break;
      case NotificationType.error:
        toastType = ToastificationType.error;
        toastIcon ??= Icons.error;
        break;
      case NotificationType.warning:
        toastType = ToastificationType.warning;
        toastIcon ??= Icons.warning;
        break;
    }

    toastification.show(
      type: toastType,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(title),
      description: RichText(
        text: TextSpan(text: body, style: const TextStyle(color: Colors.black))),
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(toastIcon),
      showProgressBar: false,
    );
  }

  @override
  void showSuccess(String message) {
    show(title: "Message", body: message, type: NotificationType.success);
  }

  @override
  void showError(String message) {
    show(title: "Error", body: message, type: NotificationType.error);
  }

  @override
  void showWarning(String message) {
    show(title: "Warning", body: message, type: NotificationType.warning);
  }
}