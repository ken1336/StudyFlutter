import 'package:my_app/todo_bloc/model/Rest.dart';
import 'package:meta/meta.dart';

class RestState {
//Todo model타입을 가진 리스트이므로 todoList의 모든 요소들은 Todo 모델 형식을 따라야한다.
  final List<Rest> restList;
  String restMessage;
  RestState({
    @required this.restList,
    @required this.restMessage,
  });

//현재는 저장된 데이터가 하나도 없기 때문에 다음과 같이 초기 상태를 정해주는 과정이 필요하다.
//(더미 데이터를 만들어 사용하는 것이다.)
  factory RestState.empty() {
    return RestState(
      restList: [
      ],
      restMessage: "default",
    );
  }

  RestState push(Rest rest){
    print("rest push: "+ rest.message);
    this.restList.add(rest);
    return RestState(restList: this.restList);

  }
  RestState update(Rest rest){
    print("rest: "+ rest.message);
    return RestState(restMessage: rest.message);
  }
  RestState pop(){
    this.restMessage="Hello";
    return RestState(restMessage: this.restMessage);
  }

  // RestState copyWith({List<Rest> todoList}) {
  //   return RestState(todoList: todoList ?? this.todoList);
  // }
}