import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RestEvent extends Equatable {}

class RestInit extends RestEvent {
  @override
  String toString() => "Rest Event:init";
}

class RestUpdate extends RestEvent {
  @override
  String toString() => "Rest Event:update";
}
