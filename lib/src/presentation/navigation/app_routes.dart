enum AppRoutes {
  welcome(designation: 'welcome', path: '/');

  const AppRoutes({
    required this.path,
    required this.designation,
  });

  final String path;
  final String designation;
}
