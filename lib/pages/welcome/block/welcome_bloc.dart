import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/welcome/block/welcome_event.dart';
import 'package:ulearning/pages/welcome/block/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    print("welcome bloc");
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
