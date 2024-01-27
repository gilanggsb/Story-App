enum RouteName {
  splashScreen('splash', '/'),
  loginScreen('login', '/login'),
  registerScreen('register', '/register'),
  homeScreen('home', '/home'),
  detailStoryScreen('detail_story', 'detail_story'),
  mapsScreen('maps', 'maps'),
  addStoryScreen('add_story', 'add_story');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
