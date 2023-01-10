import 'package:flutter/material.dart';

class PagesController {
  static String fomatSchedule({String hour = '0', String minute = '0'}) {
    String formatedHour = hour.length == 1 ? '0$hour' : hour;
    String formatedMinute = minute.length == 1 ? '0$minute' : minute;

    return '$formatedHour:$formatedMinute';
  }

  static String currentTime() {
    return fomatSchedule(
      hour: '${TimeOfDay.now().hour}',
      minute: '${TimeOfDay.now().minute}',
    );
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'The name is required';
    }

    if (value.length <= 2) {
      return 'Must be at least 2 characters';
    }

    if (value.length > 32) {
      return 'Must at most be 32 characters long';
    }

    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'The description is required';
    }

    if (value.length <= 2) {
      return 'Must be at least 2 characters';
    }

    return null;
  }
}
