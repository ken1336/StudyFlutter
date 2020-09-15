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
    print("call _mapRestUpdateState");
    RestAPI _restAPI = RestAPI();
    Rest _result;
    try{
      _result = await _restAPI.getMessage();
    }catch(e){
      print(e.toString());
    }

    yield state.update(_result);

  }


}