import 'dart:math';

class TicGame {
  Map<int, String> possiblePatterns = {
    1: '048',
    2: '012',
    3: '036',
    4: '678',
    5: '258',
    6: '147',
    7: '246',
    8: '345',
  };

  bool gameOver({required String pattern}) {
    // for storing matching keys

    List<int> matchingKeys = [];

    // get each item of the patter e.g 6578 => 6,5,...

    pattern.split('').forEach((eachItem) {
      // print(eachItem);

      // print('-------Matching List----------');

      // iterate map
      for (MapEntry possiblePattern in possiblePatterns.entries) {
        String value = possiblePattern.value;
        int key = possiblePattern.key;

        if (value.contains(eachItem)) {
          // print(key);
          matchingKeys.add(key);
        }
      }

      // print('--------NEXT item-------');
    });

    // print('Pattern $pattern : $matchingKeys');

    for (int i in matchingKeys) {
      // print(i);
      int counter = 0;
      for (int j in matchingKeys) {
        if (i == j) {
          counter++;
        }
      }
      if (counter == 3) {
        // print('$pattern pattern matched with key $i');

        // game over
        return true;
      }
    }

    return false;
  }

  String getRandomValue({required String pattern}) {
    String randomString = _generateRandomInt().toString();

    pattern.split('').forEach((char) {
      if (char == randomString) {
        randomString = _generateRandomInt().toString();
      }
    });

    return randomString;
  }

  int _generateRandomInt() => Random().nextInt(10); // 0 to 9
}

// void main() {
//   TicGame game = TicGame();
//   String patterns = '063';

//   for(int i = 0; i<= 5; i++){

//     String result = game.getRandomValue(patterns);
//     patterns += result;

//     print(patterns);

//   }
// }


// void main() {
//   TicGame ticGame = TicGame();

//   String pattern1 = '6578'; // must true
//   String pattern2 = '13462'; // must true
//   String pattern3 = '123'; // must false
//   String pattern4 = '2416'; // must true

//   bool result1 = ticGame.gameOver(pattern1);
//   print('Game over ? result 1 = $result1');

//   bool result2 = ticGame.gameOver(pattern2);
//   print('Game over ? result 1 = $result2');

//   bool result3 = ticGame.gameOver(pattern3);
//   print('Game over ? result 1 = $result3');

//   bool result4 = ticGame.gameOver(pattern4);
//   print('Game over ? result 1 = $result4');
// }
