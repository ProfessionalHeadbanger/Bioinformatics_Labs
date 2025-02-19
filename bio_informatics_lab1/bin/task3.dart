// Даны две строки s и t одинаковой длины. Найти расстояние Хэмминга dH(s,t) между ними.
// Входные данные: две последовательности ДНК s и t одинаковой длины
// Выходные данные: расстояние Хэмминга dH(s,t)

import 'dart:io';

void main() {
  print('Введите первую строку: ');
  var s = stdin.readLineSync() ?? '';
  print('Введите вторую строку: ');
  var t = stdin.readLineSync() ?? '';
  int hammingDistance = 0;
  for (int i = 0; i < s.length; i++) {
    if (s[i] != t[i]) {
      hammingDistance++;
    }
  }
  print('Расстояние Хэмминга dH(s,t): $hammingDistance');
}
