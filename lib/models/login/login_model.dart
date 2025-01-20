class LoginModel {
  String? accessToken;
  String? refreshToken;
  String? message;
  User? user;

  LoginModel({this.accessToken, this.refreshToken, this.message, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? password;
  String? email;
  int? mobile;
  String? role;
  bool? enabled;
  List<Authorities>? authorities;
  bool? accountNonLocked;
  bool? accountNonExpired;
  bool? credentialsNonExpired;

  User(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.mobile,
      this.role,
      this.enabled,
      this.authorities,
      this.accountNonLocked,
      this.accountNonExpired,
      this.credentialsNonExpired});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
    enabled = json['enabled'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(new Authorities.fromJson(v));
      });
    }
    accountNonLocked = json['accountNonLocked'];
    accountNonExpired = json['accountNonExpired'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['enabled'] = this.enabled;
    if (this.authorities != null) {
      data['authorities'] = this.authorities!.map((v) => v.toJson()).toList();
    }
    data['accountNonLocked'] = this.accountNonLocked;
    data['accountNonExpired'] = this.accountNonExpired;
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    return data;
  }
}

class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authority'] = this.authority;
    return data;
  }
}
