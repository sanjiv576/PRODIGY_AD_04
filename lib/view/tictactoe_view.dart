import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../services/tictactoe_game.dart';

class TicTacToeView extends StatefulWidget {
  const TicTacToeView({super.key});

  @override
  State<TicTacToeView> createState() => _TicTacToeViewState();
}

class _TicTacToeViewState extends State<TicTacToeView> {
  String xPlayerPattern = '';
  String oPlayerPattern = '';

  bool isXPlayerTurn = true;

  bool isScreenTouch = false;

  String? gameResult;

  late List<String> showingPatterns;
  TicGame game = TicGame();

  @override
  void initState() {
    super.initState();
    showingPatterns = List.filled(9, '');
  }

  void _toggleTurnAndText() {
    setState(() {
      isScreenTouch = !isScreenTouch;
      isXPlayerTurn = !isXPlayerTurn;
    });
  }

  void _checkGameOver(String playerPattern) {
    bool result = game.gameOver(pattern: playerPattern);

    // logic: if X player is turn off i.e false, and its result is true ==> won by player O
    // logic: if X player is turn on i.e true, and its result is true ==> won by player X
    if (result) {
      setState(() {
        gameResult = 'Won by Player ${isXPlayerTurn ? 'X' : 'O'}';
      });

      Alert(
        context: context,
        title: "GAME RESULT",
        desc: gameResult,
        style: AlertStyle(
          titleStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white),
          descStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.green),
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/home'),
            width: 120,
            child: const Text(
              "PLAY AGAIN",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  void _restartGame() {
    setState(() {
      xPlayerPattern = '';
      oPlayerPattern = '';

      isXPlayerTurn = true;

      isScreenTouch = false;

      gameResult = null;

      showingPatterns = List.filled(9, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  maxWidth: double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isXPlayerTurn ? 'Player X ⏳' : 'Player X',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Text(
                            '10',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const CircularProgressIndicator(
                          value: 50 / 60,
                          backgroundColor: Colors.white,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Text(
                      !isXPlayerTurn ? 'Player O ⏳' : 'Player O',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),

              // TicTacToe board UI
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    border: Border(
                      bottom: BorderSide.none,
                    )),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  clipBehavior: Clip.none,
                  children: List.generate(9, (index) {
                    int touchedIndex = index;
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                      onPressed: () {
                        if (showingPatterns[touchedIndex] == '') {
                          if (isXPlayerTurn) {
                            showingPatterns[touchedIndex] = 'X';

                            // insert index value to respective player
                            xPlayerPattern += touchedIndex.toString();
                            // log('X player pattern: $xPlayerPattern');
                          } else {
                            showingPatterns[touchedIndex] = 'O';
                            // insert index value to respective player
                            oPlayerPattern += touchedIndex.toString();
                            // log('O player pattern: $oPlayerPattern');
                          }

                          if (xPlayerPattern.length >= 3) {
                            _checkGameOver(xPlayerPattern);
                          }

                          if (oPlayerPattern.length >= 3) {
                            _checkGameOver(oPlayerPattern);
                          }

                          // log('Touched index: $touchedIndex');
                          _toggleTurnAndText();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Already occupied.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Center(
                        child: Text(
                          showingPatterns[
                              touchedIndex], // show touched index value replacing by X or O
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 70,
                                  fontFamily: 'Poppins',
                                  color: Colors.red),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Text(
                gameResult != null
                    ? gameResult!
                    : isXPlayerTurn
                        ? 'Player X Turn ⏳'
                        : 'Player O Turn ⏳',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.green),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shadowColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  surfaceTintColor: Colors.green,
                ),
                onPressed: _restartGame,
                child: Text(
                  'RESTART',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
