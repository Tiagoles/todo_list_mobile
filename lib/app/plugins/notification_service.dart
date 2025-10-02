import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/utils/extensions/exception_extension.dart';

class NotificationService{

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final Map<int, NotificationConfigs> _notifications = {};

  NotificationService(this._flutterLocalNotificationsPlugin);

  AsyncResult<bool> _requestNotificationPermission() async {
    try{
      bool granted = false;

      final androidPlugin =
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
      >();

      if (androidPlugin != null) {
        final bool? androidGranted = await androidPlugin.requestNotificationsPermission();
        if (androidGranted == true) granted = true;
      }

      final iosPlugin =
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
      >();

      if (iosPlugin != null) {
        final bool? iosGranted = await iosPlugin.requestPermissions(
          sound: true,
          badge: true,
          alert: true,
        );
        if (iosGranted == true) granted = true;
      }

      return Success(granted);
    } on Exception catch (e, s) {
      return Failure(NotificationException(e.message, s));
    }
  }

  AsyncResult<Map<int, NotificationConfigs>> get activeNotifications async {
    try{
      final activeNotifications = await _flutterLocalNotificationsPlugin.getActiveNotifications();
      if(activeNotifications.isEmpty) _notifications.clear();
      for(var not in activeNotifications){
        if(not.id != null && _notifications[not.id] == null){
          notificationDispose(not.id!);
        }
      }
      return Success(_notifications);
    } on Exception catch (e, s) {
      return Failure(NotificationException(e.message, s));
    }
  }

  AsyncResult<Unit> init() async {
    try{
      return _requestNotificationPermission().flatMap((granted) async {
        if(granted){
          const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@drawable/app_icon');

          const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
          );

          const InitializationSettings settings = InitializationSettings(
            android: androidSettings,
            iOS: iosSettings,
          );

          await _flutterLocalNotificationsPlugin.initialize(settings);
          _notifications.clear();
          return const Success(unit);
        }
        return Failure(NotificationException('Permission not granted', StackTrace.current));
      });
    } on Exception catch (e, s) {
      return Failure(NotificationException(e.message, s));
    }
  }

  AsyncResult<Unit> show(NotificationConfigs configs) async {
    try{
      final AndroidNotificationDetails androidDetails = configs.toAndroidDetails();

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

      final NotificationDetails details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        configs.id,
        configs.title,
        configs.body,
        details,
      );

      _notifications[configs.id] = configs;

      return const Success(unit);
    } on Exception catch (e, s){
      return Failure(NotificationException(e.message, s));
    }
  }

  AsyncResult<Unit> notificationDispose(int id) async {
    try{
      await _flutterLocalNotificationsPlugin.cancel(id);
      _notifications.remove(id);
      return const Success(unit);
    } on Exception catch (e, s) {
      return Failure(NotificationException(e.message, s));
    }
  }

}

class NotificationConfigs {
  final int id;
  final String channelId;
  final String channelName;
  final Importance importance;
  final Priority priority;
  final bool autoCancel;
  final bool ongoing;
  final String title;
  final String body;

  NotificationConfigs({
    required this.channelId,
    required this.channelName,
    this.importance = Importance.max,
    this.priority = Priority.high,
    this.autoCancel = false,
    this.ongoing = true,
    this.id = 0,
    required this.title,
    required this.body,
  });

  AndroidNotificationDetails toAndroidDetails() {
    return AndroidNotificationDetails(
      channelId,
      channelName,
      importance: importance,
      priority: priority,
      autoCancel: autoCancel,
      ongoing: ongoing,
    );
  }
}