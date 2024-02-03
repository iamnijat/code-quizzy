import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final maxInt = 10;
  final minInt = 3;
  CounterCubit() : super(CounterState(counterValue: 5));

  void increment() => emit(CounterState(
      counterValue: state.counterValue <= maxInt
          ? state.counterValue + 1
          : state.counterValue));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue >= minInt
          ? state.counterValue - 1
          : state.counterValue));
}
