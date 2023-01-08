import 'package:flutter/material.dart';

class HomeController {
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
      return 'O campo nome é obrigatório';
    }

    if (value.length <= 2) {
      return 'Nome muito pequeno';
    }

    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo descrição é obrigatório';
    }

    if (value.length <= 2) {
      return 'Descrição muito pequena';
    }

    return null;
  }
}
