import 'package:bloc_example/rest_bloc/model/Rest.dart';
import 'package:meta/meta.dart';

class RestState {
  Rest rest;
  RestState({
    @required this.rest,
  });

  factory RestState.empty() => RestState(rest: Rest(id: 0, message:"default"));

  RestState update(Rest rest) => RestState(rest: rest);
  RestState init() => RestState(rest: Rest(id: 0, message:"default"));
}
