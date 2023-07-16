import 'package:notification_permissions/notification_permissions.dart';

class NotificationPermissionHelper {
  static Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus().then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return "denied";
        case PermissionStatus.granted:
          return "granted";
        case PermissionStatus.unknown:
          return "unknown";
        case PermissionStatus.provisional:
          return "provisional";
        default:
          return "";
      }
    });
  }
}
