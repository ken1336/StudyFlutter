import 'package:bloc/bloc.dart';
import 'package:bloc_example/rest_bloc/model/Rest.dart';
import 'package:bloc_example/rest_bloc/bloc/RestEvent.dart';
import 'package:bloc_example/rest_bloc/bloc/RestState.dart';
import 'package:bloc_example/rest_bloc/repository/RestAPI.dart';

class RestBloc extends Bloc<RestEvent, RestState> {
  @override
  RestState get initialState => RestState.empty();
  RestAPI _restAPI = RestAPI();

  @override
  Stream<RestState> mapEventToState(RestEvent event) async* {
    if (event is RestInit) {
      yield* _mapRestInitToState();
    } else if (event is RestUpdate) {
      yield* _mapRestUpdateState();
    }
  }

  Stream<RestState> _mapRestInitToState() async* {
    yield state.init();
  }

  Stream<RestState> _mapRestUpdateState() async* {
    Rest _result;
    try {
      _result = await this._restAPI.getMessage();
      yield state.update(_result);
    } catch (e) {
      print("Catch error " + e.toString());
    }
  }
}
