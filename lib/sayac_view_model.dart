import 'dart:async';

class SayacViewModel {
  int _sayac = 0;
  final StreamController<int> _controller = StreamController.broadcast();

  Stream<int> get sayacStream => _controller.stream;

  Sink get _sink => _controller.sink;

  int init(){
    return _sayac;
  }
  SayacViewModel() {
    _sink.add(_sayac);
  }

  void arttir() {
    _sink.add(++_sayac);
  }

  void azalt() {
    _sink.add(--_sayac);
  }
}
