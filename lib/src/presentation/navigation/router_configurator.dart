import 'package:e_wallet/src/presentation/features/welcome/welcome_cubit.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_screen.dart';
import 'package:e_wallet/src/presentation/navigation/routes.dart';
import 'package:e_wallet/src/utils/screen_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:navigator/navigator.dart';

@lazySingleton
final class RouterConfigurator {
  late final config = GoRouter(
    debugLogDiagnostics: true,
    routes: _defineRoadMap(),
  );

  List<GoRoute> _defineRoadMap() {
    return [
      buildRoute(
        route: Routes.welcome,
        builder: (_, __) => cubitScreen<WelcomeCubit>(const WelcomeScreen()),
      ),
    ];
  }
}
