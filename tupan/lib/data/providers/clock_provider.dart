import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tupan/data/models/clock.dart';
import 'package:tupan/data/repositories/clock/clock_controller.dart';
import 'package:tupan/utils/constants.dart';

class ClockProvider extends ChangeNotifier {
  bool isActive = false;

  Future<dynamic> getlastClockByUserId(String id) {
    ClockController clockController = new ClockController();
    return clockController.getlastClockByUserId(id);
  }

  Future<bool> getLastClockAndEvaluate(String id) async {
    try {
      Response<dynamic> response = await getlastClockByUserId(Credentials.id!);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;

        final Clock lastClockData = Clock.fromJson(data);
        if (lastClockData != null && !lastClockData!.isComplete) {
          Credentials.clockIsComplete = false;
          notifyListeners();

          return false;
        } else {
          Credentials.clockIsComplete = true;
          notifyListeners();

          return true;
        }
      } else {
        // Manejar el error en la respuesta
        print(
            'Error al obtener los datos del servidor: ${response.statusCode}');
        throw Error();
      }
    } catch (e) {
      // Manejar errores de conexión u otros errores
      print('Error en la solicitud: $e');
      throw Error();
    }
  }

  void changeStateClock() {
    if (isActive) {
      isActive = false;
    } else {
      isActive = true;
    }
    notifyListeners();
  }
}
