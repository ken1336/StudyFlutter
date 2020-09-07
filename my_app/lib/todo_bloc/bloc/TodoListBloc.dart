import 'package:bloc/bloc.dart';
import 'package:my_app/todo_bloc/model/Todo.dart';
import 'package:my_app/todo_bloc/bloc/TodoListEvent.dart';
import 'package:my_app/todo_bloc/bloc/TodoListState.dart';

class TodoBloc extends Bloc<TodoListEvent, TodoState> {
  @override
  // TODO: implement initialState
  // 가장 먼저 일어나게 state의 초기화 작업
  TodoState get initialState => TodoState.empty();

  @override
  Stream<TodoState> mapEventToState(TodoListEvent event) async* {
    // TODO: implement mapEventToState
    if (event is TodoPageLoaded) {
      yield* _mapTodoPageLoadedToState();
    } else if (event is TodoListCheck) {
      yield* _mapTodoListCheckToState(event.index);
    }
  }

  Stream<TodoState> _mapTodoPageLoadedToState() async* {
    yield state.update(todoList: state.todoList);
  }

//Todo model을 만들당시 checked라는 변수가 존재했다. 해당 변수는 내가 현재 클릭한 Todo를 선택 했었는지 말았는지 확인을 위해 만들어 둔것이다.
//그래서 선택이 되있는 상황이라면 false로, 선택이 되어있지 않은 상태였다면 true로 바꿔주는 작업이 필요하다.
//state.todoList에서 해당 index의 것을 새로이 삽입하여 업데이트 시키는 과정이다.
  Stream<TodoState> _mapTodoListCheckToState(int index) async* {
    Todo currentTodo = Todo(
        id: state.todoList[index].id,
        todo: state.todoList[index].todo,
        date: state.todoList[index].date,
        desc: state.todoList[index].desc,
        checked: state.todoList[index].checked == true ? false : true);

    List<Todo> cTodoList = state.todoList;
    cTodoList[index] = currentTodo;
    yield state.update(todoList: cTodoList);
  }
}