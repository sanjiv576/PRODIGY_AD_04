import 'package:flutter/material.dart';

class TicTacToeView extends StatefulWidget {
  const TicTacToeView({super.key});

  @override
  State<TicTacToeView> createState() => _TicTacToeViewState();
}

class _TicTacToeViewState extends State<TicTacToeView> {
  List<int> playerX = [];
  List<int> playerO = [];

  bool isPlayerXTurn = true;

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
                      'Player X',
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
                      'Player O',
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
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          index.toString(),
                          // 'X',
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
                'Player X won',
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
                onPressed: () {},
                child: Text(
                  'PLAY AGAIN',
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
