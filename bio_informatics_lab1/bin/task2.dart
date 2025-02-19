// Входные данные: s - последовательность ДНК.
// Выходные данные: четыре целых числа, разделённые пробелами, представляющие собой количество символов 'А', 'C', 'G' и 'T', содержащихся в s.

import 'dart:io';

void main() {
  print('Введите строку: ');
  var s = stdin.readLineSync() ?? '';
  int a = 'A'.allMatches(s).length;
  int c = 'C'.allMatches(s).length;
  int g = 'G'.allMatches(s).length;
  int t = 'T'.allMatches(s).length;
  print('$a $c $g $t');
}
