# StudyFlutter

## BLoC pattern이란

최근 유행하는 많은 front-end framework에서는 Text field, List view등 UI에서 보여주는 변화 가능한 데이터를 상태(State)로 정의하여 관리한다. 

그런데 앱의 규모가 커지면 커질수록 state의 관리가 어려워진다. ui를 개발하다보면 컴포넌트들 간에 state를 전달하거나 공유해야 하는 일이 빈번한데, 규모가 커지면 커질수록 state를 관리하는 비용이 증가할 수 밖에 없다. front-end 진영에서는 이러한 state 관리 비용을 줄이기 위해 다양한 라이브러리들을 개발했는데, 대표적으로 redux, mobix등이 있다. 

BLoC pattern은 Bussiness Logic Component의 줄임말로, Google에서 Flutter의 상태 관리를 제어하기 위해 디자인 되었다.


![image](../images/streams_bloc.png)

위 그림이 BLoC pattern의 컨셉이다. 

1. widget들은 event를 sinks를 통해 BLoC에 전달한다.
2. BLoC은 bussiness logic을 통해 전달받은 event를 처리한다.
3. BLoC은 처리된 결과를 stream을 통해 widget들에서 publish한다.

BLoC pattern은 ui를 business logic과 분리하는것을 의미한다. 위 과정을 거쳐 Widget들은 데이터를 관리해야하는 책임에서 벗어나 오로지 어플리케이션의 화면에만 집중할 수 있게 된다.

## BLoC pattern 구현

![image](../images/bloc_data_flow.png)


위 그림은 BLoC pattern의 데이터 흐름이다. Widget(Presentational component)에서 event가 발생하면 dispatch하여 