enum RouteName {
  splashScreen('SPLASH_SCREEN'),
  loginScreen('LOGIN_SCREEN'),
  registerScreen('REGISTER_SCREEN'),
  homeScreen('HOME_SCREEN'),
  detailStoryScreen('DETAIL_STORY_SCREEN'),
  mapsScreen('MAPS_SCREEN'),
  addStoryScreen('ADD_STORY_SCREEN');

  final String value;
  const RouteName(this.value);
}
