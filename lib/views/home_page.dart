import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_cricket_game/controllers/game_logic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hand Cricket Game'),
      ),
      body: Game(),
    );
  }
}

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String battingRun;
  @override
  Widget build(BuildContext context) {
    GameLogic control = Get.put(GameLogic());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Now you are batting, hit your score',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: GetX<GameLogic>(builder: (controller) {
            return GridView.builder(
              itemCount: 6,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: InkWell(
                    onTap: () {
                      var result = controller.bowling(index);
                      battingRun = result;
                      print(result);
                    },
                    child: Center(
                      child: Text(controller.score.toString()),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        Text('Batting Run is $battingRun'),
      ],
    );
  }
}
