import 'package:flutter/material.dart';
import 'package:guess_the_word/screens/game/game_screen.dart';
import 'package:guess_the_word/values/dimens.dart';
import 'package:guess_the_word/values/strings.dart';

class ScorePage extends StatefulWidget {
  final int score;

  ScorePage({this.score});

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(Strings.you_scored),
            const SizedBox(
              height: Dimens.box_size,
            ),
            Text(
              '${widget.score}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: Dimens.box_size,
            ),
            RaisedButton(
              child: const Text(
                Strings.play_again,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GamePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
