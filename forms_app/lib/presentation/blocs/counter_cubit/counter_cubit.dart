// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0));

  void increaseBy(int value) {
    emit(
      state.copyWith(
          counter: state.counter + value,
          transactionCount: state.transactionCount + 1),
    );
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
    ));
  }
}
