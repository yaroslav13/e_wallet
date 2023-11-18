import 'package:e_wallet/src/presentation/features/welcome/welcome_cubit.dart';
import 'package:e_wallet/src/presentation/features/welcome/welcome_screen.dart';
import 'package:e_wallet/src/utils/screen_utils.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_helper.dart';

void main() {
  testGoldens(
    'Welcome screen',
    (tester) async {
      final welcomeScreen = cubitScreen<WelcomeCubit>(const WelcomeScreen());
      await pumpWidgetTwice(welcomeScreen, tester);
      await multiScreenGolden(tester, 'welcome_screen');
    },
  );
}
