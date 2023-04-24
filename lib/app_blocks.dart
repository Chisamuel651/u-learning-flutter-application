import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/app_events.dart';
import 'package:ulearning/app_states.dart';

class AppBlocks extends Bloc<AppEvents, AppStates> {
  AppBlocks() : super(InitStates()) {
    // call this event gets the value incremented.
    print("app bloc");
    on<Increment>((event, add) {
      add(AppStates(counter: state.counter + 1));
    });

    on<Decrement>((event, reduce) {
      reduce(AppStates(counter: state.counter - 1));
    });
  }
}
