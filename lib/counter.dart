import 'package:mobx/mobx.dart';

part 'counter.g.dart';
//flutter pub run build_runner build  # Flutter SDK
class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value ++;
  }
}