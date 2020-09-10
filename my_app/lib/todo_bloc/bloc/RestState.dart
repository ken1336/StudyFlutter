import 'package:my_app/todo_bloc/model/Rest.dart';
import 'package:meta/meta.dart';

class RestState {
//Todo model타입을 가진 리스트이므로 todoList의 모든 요소들은 Todo 모델 형식을 따라야한다.
  final List<Rest> restList;

  RestState({
    @required this.restList,
  });

//현재는 저장된 데이터가 하나도 없기 때문에 다음과 같이 초기 상태를 정해주는 과정이 필요하다.
//(더미 데이터를 만들어 사용하는 것이다.)
  factory RestState.empty() {
    return RestState(
      restList: [
      ],
    );
  }

  RestState push(Rest rest){
    this.restList.add(rest);
    return RestState(restList: this.restList);

  }
  RestState pop(){
    this.restList.remove(this.restList.first);
    return RestState(restList: restList ?? this.restList);
  }

  // RestState copyWith({List<Rest> todoList}) {
  //   return RestState(todoList: todoList ?? this.todoList);
  // }
}