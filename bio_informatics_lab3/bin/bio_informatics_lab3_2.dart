import 'dart:io';
import 'dart:async';

Future<void> main() async {
  String s1 = await File('bin\\input1.txt').readAsString();
  String s2 = await File('bin\\input2.txt').readAsString();

  s1 = s1.trim();
  s2 = s2.trim();

  final stopwatch = Stopwatch()..start();
  int result = wagnerFisherOptimized(s1, s2);
  stopwatch.stop();

  print('Редакционное расстояние: $result');
  print('Время выполнения: ${stopwatch.elapsedMilliseconds} миллисекунд');
}

int wagnerFisherOptimized(String s1, String s2) {
  if (s1.length > s2.length) {
    var temp = s1;
    s1 = s2;
    s2 = temp;
  }

  List<int> prevRow = List.generate(s1.length + 1, (i) => i);
  List<int> currRow = List.filled(s1.length + 1, 0);

  for (int i = 1; i <= s2.length; i++) {
    currRow[0] = i;
    for (int j = 1; j <= s1.length; j++) {
      if (s2[i - 1] == s1[j - 1]) {
        currRow[j] = prevRow[j - 1];
      } else {
        currRow[j] = 1 +
            [prevRow[j - 1], prevRow[j], currRow[j - 1]]
                .reduce((a, b) => a < b ? a : b);
      }
    }
    var temp = prevRow;
    prevRow = currRow;
    currRow = temp;
  }

  return prevRow[s1.length];
}
