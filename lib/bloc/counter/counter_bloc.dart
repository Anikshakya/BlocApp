import 'package:bloc/bloc.dart';
import 'package:blocapp/bloc/counter/counter_event.dart';
import 'package:blocapp/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  _increment(IncrementCounter event, Emitter emit) {
    emit(state.copyWith(count: state.count +1));
  }

  _decrement(DecrementCounter event, Emitter emit) {
    emit(state.copyWith(count: state.count -1));
  }
}