import 'package:bloc_intro_46/bloc/counter_event.dart';
import 'package:bloc_intro_46/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counter + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      if (state.counter >= 1) {
        emit(CounterDecrementState(state.counter - 1));
      }
    });
  }
}
