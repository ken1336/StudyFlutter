import 'package:bloc/bloc.dart';
import 'package:my_app/todo_bloc/model/Rest.dart';
import 'package:my_app/todo_bloc/bloc/RestEvent.dart';
import 'package:my_app/todo_bloc/bloc/RestState.dart';
import 'package:my_app/todo_bloc/repository/RestAPI.dart';
class RestBloc extends Bloc<RestEvent, RestState> {
  @override
  // 가장 먼저 일어나게 state의 초기화 작업
  RestState get initialState => RestState.empty();

  @override
  Stream<RestState> mapEventToState(RestEvent event) async* {
    print(event.toString());
    if (event is RestPop) {
      yield* _mapRestPopToState();
    } else if (event is RestPush) {
      yield* _mapRestPushToState();
    }
  }

  Stream<RestState> _mapRestPopToState() async* {


    yield state.pop();
  }
  Stream<RestState> _mapRestPushToState() async* {
    print("call _mapRestPushToState");
    RestAPI _restAPI = RestAPI();
    var _result;
    await _restAPI.getMessage().then((value) => _result = value);
    print(_result);
    yield state.push(_result);
  }
}