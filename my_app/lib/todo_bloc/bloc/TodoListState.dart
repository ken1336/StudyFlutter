import 'package:my_app/todo_bloc/model/Todo.dart';
import 'package:meta/meta.dart';

class TodoState {
//Todo model타입을 가진 리스트이므로 todoList의 모든 요소들은 Todo 모델 형식을 따라야한다.
  final List<Todo> todoList;

  TodoState({
    @required this.todoList,
  });

//현재는 저장된 데이터가 하나도 없기 때문에 다음과 같이 초기 상태를 정해주는 과정이 필요하다.
//(더미 데이터를 만들어 사용하는 것이다.)
  factory TodoState.empty() {
    return TodoState(
      todoList: [
        Todo(
            id: 0,
            todo: "토익 공부하기",
            date: "2020.02.27",
            checked: false,
            desc: "토익 공부 열심히 해야해..."),
        Todo(
            id: 1,
            todo: "swift인강듣기",
            date: "2020.02.27",
            checked: false,
            desc: "ios 위젯을 만들어야하는데..."),
        Todo(
            id: 2,
            todo: "양파 썰기",
            date: "2020.02.27",
            checked: false,
            desc: "양파야 너무 맵다..."),
        Todo(
            id: 3,
            todo: "가스비 내기!!",
            date: "2020.02.27",
            checked: false,
            desc: "통장에서 자동이체라니...으으으으 마음 아파."),
        Todo(
            id: 4,
            todo: "월세 내기!",
            date: "2020.02.27",
            checked: false,
            desc: "월세는 언제 내야 하더라..."),
        Todo(
            id: 5,
            todo: "영양제 챙겨 먹",
            date: "2020.02.27",
            checked: false,
            desc: "영양제를 꼭꼭 챙겨먹어요...특히 비타민 D가 필요해"),
      ],
    );
  }

  TodoState update({List<Todo> todoList}) {
    return copyWith(
      todoList: todoList,
    );
  }

  TodoState copyWith({List<Todo> todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }
}