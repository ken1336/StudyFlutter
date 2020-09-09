import 'package:meta/meta.dart';
//해당 클래스를 통하여 모델을 선언하여 주고 사용할수 있도록 한다.
class Rest {
    final int id; // Rest API id
    final String messgae;// Message form server

  
	
  Rest({
    @required this.id,
    @required this.messgae,

  });
}