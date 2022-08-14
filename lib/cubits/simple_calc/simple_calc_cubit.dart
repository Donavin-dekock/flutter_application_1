import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'simple_calc_state.dart';

class SimpleCalcCubit extends Cubit<SimpleCalcState> {
  SimpleCalcCubit() : super(SimpleCalcCalculated({}, 0));

  List<num> validDenominations = [200, 50, 20, 10, 5, 2, 1, 0.5, 0.2];

  void calculateWithMod(double? cost, double? tender) {
    if (cost == null || tender == null) return;

    num totalChange = tender - cost;
    Map<String, num> breakdown = {};

    // TODO - Calculate your breakdown here, put the results in a map, with the validDenominations as the key, and the result as the value

    if (totalChange <= -1) {
      print("Cost exceeds funds.");
    } else {
      validDenominations.forEach((i) {
        var result = (totalChange / i).floor();
        totalChange = totalChange % i;
        breakdown['${[i]}'] = result;
      });
    }

    emit(SimpleCalcCalculated(breakdown, totalChange));
  }

  void clearAll() {
    emit(SimpleCalcCalculated({}, 0));
  }
}
