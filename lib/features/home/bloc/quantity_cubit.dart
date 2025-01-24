import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<int> {

  QuantityCubit() : super(0);


  void setMinimumOrder(int count ) {
    emit(count);
  }
  void increment() {
    emit(state + 1);
  }
void updateValue(int quantity) {
    emit(quantity);
  }

  void decrement() {
      emit(state - 1);
  }
}
