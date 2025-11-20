class AppUser {
  final String name;
  final String id;
  final String pin;

  AppUser({required this.name, required this.id, required this.pin});
}

final List<AppUser> users_city = [
  AppUser(name: "Hasan", id: "1001", pin: "1234"),
  AppUser(name: "Mikisuluk1", id: "1002", pin: "5678"),
  AppUser(name: "Allan", id: "1003", pin: "9999"),
];

final List<AppUser> users_valby = [
  AppUser(name: "Hasan", id: "1001", pin: "1234"),
  AppUser(name: "Mikisuluk2", id: "1004", pin: "9901"),
  AppUser(name: "Mikisuluk3", id: "1005", pin: "9902"),
];

final List<AppUser> users_airport = [
  AppUser(name: "Hasan", id: "1001", pin: "1234"),
  AppUser(name: "Mikisuluk3", id: "1005", pin: "9902"),
  AppUser(name: "Allan", id: "1003", pin: "9999"),
];
