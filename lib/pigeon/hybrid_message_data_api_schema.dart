import 'package:pigeon/pigeon.dart';

class MessageData {
  String? title;
  String? subtitle;
}

@FlutterApi()
abstract class FlutterMessageDataApi {
  void displayMessage(MessageData messageData);
}

@HostApi()
abstract class HostMessageDataApi {
  void finishDisplayMessage(MessageData messageData);
  void cancel();
}
