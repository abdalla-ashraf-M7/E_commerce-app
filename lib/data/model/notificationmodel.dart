class NotificationModel {
  String? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  String? notificationsUser;
  String? notificationsDate;

  NotificationModel({this.notificationsId, this.notificationsTitle, this.notificationsBody, this.notificationsUser, this.notificationsDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsUser = json['notifications_user'];
    notificationsDate = json['notifications_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications_id'] = this.notificationsId;
    data['notifications_title'] = this.notificationsTitle;
    data['notifications_body'] = this.notificationsBody;
    data['notifications_user'] = this.notificationsUser;
    data['notifications_date'] = this.notificationsDate;
    return data;
  }
}
