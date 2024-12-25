import 'dart:convert';

class UserAccount {
  dynamic id;
  String username;
  String password;
  String? email;
  String? first_name;
  String? last_name;
  String? password2;
  UserAccount({
    this.id,
    required this.username,
    required this.password,
    this.email,
    this.first_name,
    this.last_name,
    this.password2,
  });

  UserAccount copyWith({
    dynamic? id,
    String? username,
    String? password,
    String? email,
    String? first_name,
    String? last_name,
    String? password2,
  }) {
    return UserAccount(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      password2: password2 ?? this.password2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'password2': password2,
    };
  }

  static UserAccount? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return UserAccount(
        id: map['id'],
        username: map['username'],
        password: map['password'],
        email: map['email'],
        first_name: map['first_name'],
        last_name: map['last_name'],
        password2: map['password2'],
      );
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static UserAccount? fromJson(String source) =>
      UserAccount.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAccount(id: $id, username: $username, password: $password, email: $email, first_name: $first_name, last_name: $last_name, password2: $password2)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAccount &&
        other.id == id &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.password2 == password2;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        password2.hashCode;
  }
}
