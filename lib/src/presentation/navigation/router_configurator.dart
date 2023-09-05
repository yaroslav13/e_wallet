import 'package:e_wallet/src/presentation/features/welcome/welcome_cubit.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_screen.dart';
import 'package:e_wallet/src/presentation/navigation/app_routes.dart';
import 'package:e_wallet/src/utils/screen_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
final class RouterConfigurator {
  late final config = GoRouter(
    debugLogDiagnostics: true,
    routes: _defineRoadMap(),
  );

  List<GoRoute> _defineRoadMap() {
    return [
      GoRoute(
        name: AppRoutes.welcome.designation,
        path: AppRoutes.welcome.path,
        builder: (_, __) => cubitScreen<WelcomeCubit>(const WelcomeScreen()),
      ),
    ];
  }
}
