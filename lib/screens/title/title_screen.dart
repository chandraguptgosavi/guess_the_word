import 'package:flutter/material.dart';
import 'package:guess_the_word/screens/game/game_screen.dart';
import 'package:guess_the_word/values/strings.dart';

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: (const Text(Strings.title)),),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    Strings.get_ready,
                  ),
                  Text(
                    Strings.guess,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: RaisedButton(
                  child: const Text(
                    Strings.play,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => GamePage()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
