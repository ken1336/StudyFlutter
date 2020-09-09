import 'package:bloc/bloc.dart';
import 'package:my_app/todo_bloc/model/Rest.dart';
import 'package:my_app/todo_bloc/bloc/RestEvent.dart';
import 'package:my_app/todo_bloc/bloc/RestState.dart';
class TodoBloc extends Bloc<RestEvent, RestState> {
  @override
  // TODO: implement initialState
  // 가장 먼저 일어나게 state의 초기화 작업
  RestState get initialState => RestState.empty();

  @override
  Stream<RestState> mapEventToState(RestEvent event) async* {
    // TODO: implement mapEventToState
    if (event is RestPop) {
      yield* _mapRestPopToState();
    } else if (event is RestPush) {
      yield* _mapRestPushToState(event.rest);
    }
  }

  Stream<RestState> _mapRestPopToState() async* {
    yield state.pop();
  }

//Todo model을 만들당시 checked라는 변수가 존재했다. 해당 변수는 내가 현재 클릭한 Todo를 선택 했었는지 말았는지 확인을 위해 만들어 둔것이다.
//그래서 선택이 되있는 상황이라면 false로, 선택이 되어있지 않은 상태였다면 true로 바꿔주는 작업이 필요하다.
//state.todoList에서 해당 index의 것을 새로이 삽입하여 업데이트 시키는 과정이다.
  Stream<RestState> _mapRestPushToState(Rest event) async* {

    yield state.push(event);
  }
}