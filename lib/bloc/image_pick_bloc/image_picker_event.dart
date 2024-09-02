import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PickImageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PickImage extends PickImageEvent {
  final BuildContext context;

  PickImage(this.context);

  @override
  List<Object> get props => [context];
}
