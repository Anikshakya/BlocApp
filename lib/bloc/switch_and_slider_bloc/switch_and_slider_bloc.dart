

import 'package:bloc/bloc.dart';
import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_event.dart';
import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_state.dart';

class SwitchAndSliderBloc extends Bloc<SwitchAndSliderEvent, SwitchAndSliderState> {
  SwitchAndSliderBloc() : super(const SwitchAndSliderState()) {
    on<ToggleSwitch>(_toggleSwitch);
    on<ToggleSlider>(_toogleSlider);
  }

  _toggleSwitch(event, emit) {
    emit(state.copyWith(isSwitchVal: !state.isSwicth));
  }

  _toogleSlider(event, emit) {
    emit(state.copyWith(changedSliderVal: event.changedVal));
  }
}
