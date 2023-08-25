import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_cubit.freezed.dart';
part 'welcome_state.dart';

final class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState());
}
