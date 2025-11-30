// define all of the routes in the app
class AppRoutes {
  // Route names
  static const String login = '/login';
  static const String branches = '/branches';
  static const String users = '/users';
  static const String workDay = '/work-day';

  // prevent instantiation
  const AppRoutes._();

  // checker if the route is valid
  static bool isValidRoute(String? route) {
    return route == login ||
        route == branches ||
        route == users ||
        route == workDay;
  }

  // all of the routes
  static List<String> get allRoutes => [login, branches, users, workDay];
}
