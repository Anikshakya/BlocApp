

import 'package:equatable/equatable.dart';

class SwitchAndSliderEvent extends Equatable {
  const SwitchAndSliderEvent();

  @override
  List<Object> get props => [];
}

class ToggleSwitch extends SwitchAndSliderEvent{}

class ToggleSlider extends SwitchAndSliderEvent{
  final double changedVal;

  const ToggleSlider({required this.changedVal});

  @override
  List<Object> get props => [changedVal];
}
