import 'package:meta/meta.dart';

class Rest {
  final int id; // Rest API id
  final String message; // Message form server

  Rest({
    @required this.id,
    @required this.message,
  });
}
