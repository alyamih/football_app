class UserItem {
  String? name;
  String? email;
  bool? notificationOn;

  UserItem({this.name, this.email, this.notificationOn});

  factory UserItem.fromJson(Map<String, dynamic> parsedJson) {
    return UserItem(
      name: parsedJson['name'] ?? "",
      email: parsedJson['email'] ?? "",
      notificationOn: parsedJson['notificationOn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "notificationOn": notificationOn,
    };
  }
}
