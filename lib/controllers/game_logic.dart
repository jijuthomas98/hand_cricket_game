import 'dart:math';
import 'package:get/get.dart';

class GameLogic extends GetxController {
  Random random = Random();

  var score = 0.obs;
  String bowling(int battingRun) {
    int bowl = random.nextInt(6);
    if (bowl == battingRun) {
      return out();
    } else {
      String finalRun = runScored(battingRun);
      return finalRun;
    }
  }

  String out() {
    return 'Out';
  }

  String runScored(int battingRun) {
    int run = 0;

    int finalRun = score.value = run + battingRun;
    return finalRun.toString();
    ;
  }
}
