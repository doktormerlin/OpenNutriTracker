import 'package:flutter/material.dart';
import 'package:opennutritracker/core/domain/entity/intake_entity.dart';
import 'package:opennutritracker/core/domain/entity/intake_type_entity.dart';
import 'package:opennutritracker/core/domain/usecase/add_intake_usecase.dart';
import 'package:opennutritracker/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:opennutritracker/core/domain/usecase/get_user_usecase.dart';
import 'package:opennutritracker/core/utils/calc/calorie_goal_calc.dart';
import 'package:opennutritracker/core/utils/id_generator.dart';
import 'package:opennutritracker/features/add_meal/domain/entity/product_entity.dart';

class MealDetailBloc {
  final _addIntakeUseCase = AddIntakeUsecase();
  final _addTrackedDayUsecase = AddTrackedDayUsecase();
  final _getUserUsecase = GetUserUsecase();

  void addIntake(BuildContext context, String unit, String amountText,
      IntakeTypeEntity type, ProductEntity product) async {
    final quantity = double.parse(amountText);

    final intakeEntity = IntakeEntity(
        id: IdGenerator.getUniqueID(),
        unit: unit,
        amount: quantity,
        type: type,
        product: product,
        dateTime: DateTime.now());

    _addIntakeUseCase.addIntake(context, intakeEntity);

    if (await _addTrackedDayUsecase.hasTrackedDay(context, DateTime.now())) {
      _addTrackedDayUsecase.addDayCaloriesTracked(
          context, DateTime.now(), intakeEntity.totalKcal);
    } else {
      final userEntity = await _getUserUsecase.getUserData(context);
      final totalKcalGoal = CalorieGoalCalc.getTdee(userEntity);
      _addTrackedDayUsecase.addNewTrackedDay(
          context, DateTime.now(), totalKcalGoal);
    }
  }
}
