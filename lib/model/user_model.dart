import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserModel extends ParseObject implements ParseCloneable {
  UserModel(
      {required String username,
      required int telefone,
      required String email,
      required String password})
      : super(_keyTableName) {
    this
      ..set<String>('username', username)
      ..set<int>('telefone', telefone)
      ..set<String>('email', email)
      ..set<String>('password', password);
  }

  UserModel.clone() : this(username: '', telefone: 0, email: '', password: '');

  static const String _keyTableName = 'User';

  @override
  UserModel clone(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      telefone: map['telefone'] ?? 0,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  // Métodos do modelo de usuário

  String get username => get<String>('username') ?? '';
  set username(String value) => set<String>('username', value);

  int get telefone => get<int>('telefone') ?? 0;
  set telefone(int value) => set<int>('telefone', value);

  String get email => get<String>('email') ?? '';
  set email(String value) => set<String>('email', value);

  String get password => get<String>('password') ?? '';
  set password(String value) => set<String>('password', value);
}
