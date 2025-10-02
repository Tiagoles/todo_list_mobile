import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/plugins/notification_service.dart';
import 'package:smaservicos/app/ui/inspecao/viewmodels/inspecao_viewmodel.dart';

final _configs = NotificationConfigs(
  id: 0,
  channelId: 'repeating_channel',
  channelName: 'Notificação Persistente',
  importance: Importance.max,
  priority: Priority.high,
  autoCancel: false,
  ongoing: true,
  title: 'Atenção!',
  body: 'Você possui inspeções não enviadas ou em andamento! Confira a página de lançamentos.',
);

class NeedsReleaseNotificationViewModel {
  final NotificationService _notificationService;
  final InspecaoViewModel _inspecaoViewModel;
  Timer? _checkNotificationTimer;

  NeedsReleaseNotificationViewModel(this._notificationService, this._inspecaoViewModel);

  void init() {
    reaction(
      fireImmediately: true,
  (_) => _inspecaoViewModel.countReleases,
(lenght) async {
        if (lenght <= 0) {
          stopNotificationChecker();
          cancelNotification();
          return;
        }
        startNotificationChecker();
      },
    );
  }

  AsyncResult<Unit> showRepeatingNotification() async {
    return _notificationService.activeNotifications
      .flatMap((notifications){
        if(notifications[_configs.id] != null) {
          return const Success(unit);
        }
        return _notificationService.show(_configs);
      });
  }

  void startNotificationChecker() {
    if (_checkNotificationTimer != null && _checkNotificationTimer!.isActive) {
      return;
    }

    showRepeatingNotification();

    _checkNotificationTimer?.cancel();
    _checkNotificationTimer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      await showRepeatingNotification();
    });
  }

  void stopNotificationChecker() {
    _checkNotificationTimer?.cancel();
  }

  Future<void> cancelNotification() async {
    await _notificationService.notificationDispose(_configs.id);
  }
}