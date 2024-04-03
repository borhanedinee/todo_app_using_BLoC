class User {
  int? userId;
  String? userUsername;
  String? userPassword;
  String? userEmail;
  String? userAvatar;

  User(
      {this.userId,
      this.userUsername,
      this.userPassword,
      this.userEmail,
      this.userAvatar});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userUsername = json['user_username'];
    userPassword = json['user_password'];
    userEmail = json['user_email'];
    userAvatar = json['user_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_username'] = this.userUsername;
    data['user_password'] = this.userPassword;
    data['user_email'] = this.userEmail;
    data['user_avatar'] = this.userAvatar;
    return data;
  }
}