class GetUserModel {
  int? id;
  String? username;
  String? password;
  String? email;
  int? mobile;
  String? role;
  bool? enabled;
  List<Authorities>? authorities;
  bool? credentialsNonExpired;
  bool? accountNonExpired;
  bool? accountNonLocked;

  GetUserModel(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.mobile,
      this.role,
      this.enabled,
      this.authorities,
      this.credentialsNonExpired,
      this.accountNonExpired,
      this.accountNonLocked});

  GetUserModel.fromJson(Map<String, dynamic> json) {
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
    credentialsNonExpired = json['credentialsNonExpired'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
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
    data['credentialsNonExpired'] = this.credentialsNonExpired;
    data['accountNonExpired'] = this.accountNonExpired;
    data['accountNonLocked'] = this.accountNonLocked;
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
