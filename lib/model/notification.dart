class NotificationModel {
  String riderName;
  String description;
  bool isRead;
  DateTime notiTime;
  String? profileImageUrl;
  String? imageUrl;

  NotificationModel(
      {required this.riderName,
      required this.description,
      required this.isRead,
      required this.notiTime,
      this.profileImageUrl = "",
      this.imageUrl = ""});
}
