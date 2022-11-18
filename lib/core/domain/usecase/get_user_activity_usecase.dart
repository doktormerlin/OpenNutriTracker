import 'package:flutter/material.dart';
import 'package:opennutritracker/core/data/repository/user_activity_repository.dart';
import 'package:opennutritracker/core/domain/entity/user_activity_entity.dart';
import 'package:provider/provider.dart';

class GetUserActivityUsecase {
  Future<List<UserActivityEntity>> _getTodayUserActivity(BuildContext context) {
    final userActivityRepository =
        Provider.of<UserActivityRepository>(context, listen: false);
    return userActivityRepository.getAllUserActivityByDate(DateTime.now());
  }
}
