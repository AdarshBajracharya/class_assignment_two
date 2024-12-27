import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeCubit extends Cubit<double> {
  VolumeCubit() : super(0.0);

  void calculateVolume(double side) {
    emit(side * side * side);
  }
}
