abstract class UserState {
  String initialName;
  String name;

  String get currentName => name ?? initialName;

  void onChangeName(String newName) {
    name = newName;
  }

  void resetName() {
    name = initialName;
  }
}
