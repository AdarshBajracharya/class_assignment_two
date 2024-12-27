import 'package:class_assignment_2/cubit/area_circle_cubit.dart';
import 'package:class_assignment_2/cubit/cube_volume_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/area_circle_cubit_view.dart';
import 'package:class_assignment_2/view/cube_volume_cubit_view.dart';
import 'package:class_assignment_2/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._circleCubit,
    this._simpleInterestCubit,
    this._volumeCubit,
  ) : super(null);

  final CircleAreaCubit _circleCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final VolumeCubit _volumeCubit;

  void openCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _circleCubit,
          child: const CircleAreaView(),
        ),
      ),
    );
  }

  void openArithmeticView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: const SimpleInterestView(),
        ),
      ),
    );
  }

  void openStudentView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _volumeCubit,
          child: const VolumeCubitView(),
        ),
      ),
    );
  }
}
