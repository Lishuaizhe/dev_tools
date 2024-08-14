import 'package:get/get.dart';
import 'dart:math';

import 'state.dart';

class Game2048Logic extends GetxController {
  final Game2048State state = Game2048State();

  List<List<int>> get board => state.game.value.board;

  int get score => state.game.value.score;

  bool get isGameOver => state.game.value.isGameOver;

  void move(String direction) {
    if (!state.game.value.isGameOver) {
      state.game.value.move(direction);
      state.game.refresh();
    }
  }

  void reset() {
    state.game.value = Game2048();
    state.game.refresh();
  }
}

class Game2048 {
  late List<List<int>> board;
  late int score;
  late bool isGameOver;

  Game2048() {
    board = List.generate(4, (_) => List.generate(4, (_) => 0));
    score = 0;
    isGameOver = false;
    _addNewTile();
    _addNewTile();
  }

  void _addNewTile() {
    List<int> emptyTiles = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (board[i][j] == 0) {
          emptyTiles.add(i * 4 + j);
        }
      }
    }

    if (emptyTiles.isNotEmpty) {
      int randomIndex = emptyTiles[Random().nextInt(emptyTiles.length)];
      int row = randomIndex ~/ 4;
      int col = randomIndex % 4;
      board[row][col] = Random().nextBool() ? 2 : 4;
    }
  }

  void _moveLeft() {
    for (int i = 0; i < 4; i++) {
      List<int> newRow = _compress(board[i]);
      for (int j = 0; j < 4; j++) {
        board[i][j] = newRow[j];
      }
    }
  }

  void _moveRight() {
    for (int i = 0; i < 4; i++) {
      List<int> newRow =
          _compress(board[i].reversed.toList()).reversed.toList();
      for (int j = 0; j < 4; j++) {
        board[i][j] = newRow[j];
      }
    }
  }

  void _moveUp() {
    for (int j = 0; j < 4; j++) {
      List<int> col = [];
      for (int i = 0; i < 4; i++) {
        col.add(board[i][j]);
      }
      List<int> newCol = _compress(col);
      for (int i = 0; i < 4; i++) {
        board[i][j] = newCol[i];
      }
    }
  }

  void _moveDown() {
    for (int j = 0; j < 4; j++) {
      List<int> col = [];
      for (int i = 0; i < 4; i++) {
        col.add(board[i][j]);
      }
      List<int> newCol = _compress(col.reversed.toList()).reversed.toList();
      for (int i = 0; i < 4; i++) {
        board[i][j] = newCol[i];
      }
    }
  }

  List<int> _compress(List<int> row) {
    List<int> newRow = List.generate(4, (_) => 0);
    int index = 0;
    for (int i = 0; i < 4; i++) {
      if (row[i] != 0) {
        newRow[index] = row[i];
        index++;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (newRow[i] != 0 && newRow[i] == newRow[i + 1]) {
        newRow[i] *= 2;
        score += newRow[i];
        for (int j = i + 1; j < 3; j++) {
          newRow[j] = newRow[j + 1];
        }
        newRow[3] = 0;
      }
    }
    return newRow;
  }

  void move(String direction) {
    switch (direction) {
      case 'left':
        _moveLeft();
        break;
      case 'right':
        _moveRight();
        break;
      case 'up':
        _moveUp();
        break;
      case 'down':
        _moveDown();
        break;
      default:
        throw Exception('Invalid direction');
    }
    _addNewTile();
    _checkGameOver();
  }

  void _checkGameOver() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (board[i][j] == 0) {
          return;
        }
        if (i < 3 && board[i][j] == board[i + 1][j]) {
          return;
        }
        if (j < 3 && board[i][j] == board[i][j + 1]) {
          return;
        }
      }
    }
    isGameOver = true;
  }

  @override
  String toString() {
    return board.map((row) => row.join(' ')).join('\n');
  }
}
