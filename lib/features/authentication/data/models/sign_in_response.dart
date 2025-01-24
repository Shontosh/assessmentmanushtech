

class SignInResponse {
  SignInResponse({
      User? user,
      String? token,}){
    _user = user;
    _token = token;
}

  SignInResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  User? _user;
  String? _token;
  SignInResponse copyWith({  User? user,
  String? token,
}) => SignInResponse(  user: user ?? _user,
  token: token ?? _token,
);
  User? get user => _user;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

class User {
  User({
      String? username, 
      String? phone,}){
    _username = username;
    _phone = phone;
}

  User.fromJson(dynamic json) {
    _username = json['username'];
    _phone = json['phone'];
  }
  String? _username;
  String? _phone;
User copyWith({  String? username,
  String? phone,
}) => User(  username: username ?? _username,
  phone: phone ?? _phone,
);
  String? get username => _username;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['phone'] = _phone;
    return map;
  }

}