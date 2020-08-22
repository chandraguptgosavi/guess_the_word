import 'package:flutter/material.dart';
import 'package:guess_the_word/screens/game/game_bloc.dart';
import 'package:guess_the_word/screens/score/score_screen.dart';
import 'package:guess_the_word/values/strings.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final bloc = GameBloc();

  @override
  void initState() {
    super.initState();
    bloc.resetList();
    bloc.nextWord();
  }

  @override
  Widget build(BuildContext context) {
    bloc.eventGameFinishedStream.listen((event) {
      _onGameFinished(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    Strings.word_is,
                  ),
                  StreamBuilder<String>(
                    stream: bloc.wordStream,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '${snapshot.data}',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }
                      return Container(width: 0);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StreamBuilder<int>(
                          stream: bloc.timerStream,
                          builder: (_, snapshot) {
                            if(snapshot.hasData){
                              return Text('0:0${snapshot.data}');
                            }
                         return Text('0:10');
                          }),
                      StreamBuilder<int>(
                        stream: bloc.scoreStream,
                        initialData: 0,
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data}',
                            );
                          }
                          return Container(width: 0);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: const Text(Strings.skip),
                        onTap: () => bloc.onSkip(),
                      ),
                      RaisedButton(
                        child: const Text(
                          Strings.got_it,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          bloc.onCorrect();
                        },
                      ),
                      GestureDetector(
                        child: const Text(Strings.end),
                        onTap: () {
                          _onGameFinished(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onGameFinished(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ScorePage(
          score: bloc.score,
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
