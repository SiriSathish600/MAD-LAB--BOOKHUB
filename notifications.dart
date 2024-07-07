import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(
      // set the icon for the notification
      'resource://drawable/res_notification_icon',
      // set the color for the notification
      Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // create a new notification
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1,
                channelKey: 'basic_channel',
                title: 'New Notification',
                body: 'This is a new notification',
                notificationLayout: NotificationLayout.BigText,
              ),
            );
          },
          child: Text('Create Notification'),
        ),
      ),
    );
  }
}
