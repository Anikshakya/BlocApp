
import 'package:equatable/equatable.dart';

class SwitchAndSliderState extends Equatable {
  final bool isSwicth;
  final double sliderValue;

  const SwitchAndSliderState({this.isSwicth = false, this.sliderValue = 0.0});

  SwitchAndSliderState copyWith ({bool? isSwitchVal, double? changedSliderVal}){
    return SwitchAndSliderState(
      isSwicth: isSwitchVal ?? isSwicth,
      sliderValue: changedSliderVal ?? sliderValue
    );
  }
  
  @override
  List<Object> get props => [isSwicth, sliderValue];
}
