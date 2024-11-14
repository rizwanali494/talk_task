import 'dart:async';

class BooleanStreamManager {

  static final  _controller = StreamController<bool>.broadcast();


  static Stream<bool> get boolStream => _controller.stream;

  static void updateValue(bool value) {
    _controller.add(value);
  }

  static void dispose() {
    _controller.close();
  }
}




class BooleanStreamManagerRecurringScreen {

  static final  _controller = StreamController<bool>.broadcast();


  static Stream<bool> get boolStream => _controller.stream;

  static void updateValue(bool value) {
    _controller.add(value);
  }

  static void dispose() {
    _controller.close();
  }
}
