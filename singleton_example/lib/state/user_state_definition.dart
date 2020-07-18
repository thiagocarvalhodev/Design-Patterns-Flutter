import 'package:singleton_example/state/user_state.dart';

/// Implementação do Design Pattern Singleton para criação do Objeto.
class UserStateDefinition extends UserState {
  static UserStateDefinition _instance;

  UserStateDefinition._internal() {
    this.initialName = 'Thiago';
  }

  static UserStateDefinition getState() {
    if (_instance == null) {
      _instance = UserStateDefinition._internal();
    }

    return _instance;
  }
}
