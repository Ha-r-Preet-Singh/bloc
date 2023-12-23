import 'package:bloc_intro_46/bloc/counter_event.dart';
import 'package:bloc_intro_46/bloc/counter_state.dart';
import 'package:bloc_intro_46/color_bloc/color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBloc extends Bloc<CounterEvent, ColorState> {
  ColorBloc() : super(ColorInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(ColorIncrementState(Colors.green));
    });

    on<CounterDecrementEvent>((event, emit) {

        emit(ColorDecrementState(Colors.red));

    });
  }
}
