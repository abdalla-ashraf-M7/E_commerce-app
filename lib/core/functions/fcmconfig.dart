import 'package:e_commerce/controller/order/myorderscontroller.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

permissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

fcmConfig() {
  AudioPlayer audioPlayer = AudioPlayer();
  FirebaseMessaging.onMessage.listen((message) async {
    print("==============================notification===========");
    print(message.notification!.title);
    print(message.notification!.body);
    await audioPlayer.setAsset(Appimageassets.notification);
    Get.snackbar("${message.notification!.title}", "${message.notification!.body}");
    await audioPlayer.play();

    refrechNotificationPage(message.data);
  });
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("==============================Background notification===========");

  print("Handling a background message: ${message.notification!.title}");
  print("Handling a background message: ${message.notification!.body}");
}

refrechNotificationPage(Map data) {
  print("====================");
  print(data['pageid']);
  print(data['pagename']);
  if (Get.currentRoute == "/myorders" && data['pagename'] == "myorders") {
    MyOrdersControllerImp controller = Get.find();
    controller.refreshMyOrderspage();
  }
}
