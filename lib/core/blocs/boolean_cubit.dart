import 'package:flutter_bloc/flutter_bloc.dart';

class BooleanCubit extends Cubit<bool> {
  BooleanCubit() : super(false);

  void updateState(bool value) {
    emit(value);
  }
}
