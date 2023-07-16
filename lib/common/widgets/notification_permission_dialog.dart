import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:task_managment_with_riverpod/common/widgets/height_spacer.dart';

showNotificationPermissionDialog(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications_active),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Allow Wedsly Planner App to send you the notification",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        NotificationPermissions.requestNotificationPermissions(
                            iosSettings: const NotificationSettingsIos(sound: true, badge: true, alert: true));
                      },
                      child: Text("Allow"))
                ],
              ),
            ),
          ),
        );
      });
}
