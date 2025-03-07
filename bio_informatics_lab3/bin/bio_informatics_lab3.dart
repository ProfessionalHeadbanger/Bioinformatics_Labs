import 'dart:io';
import 'dart:async';

Future<void> main() async {
  String s1 = await File('bin\\input1.txt').readAsString();
  String s2 = await File('bin\\input2.txt').readAsString();

  s1 = s1.trim();
  s2 = s2.trim();

  final stopwatch = Stopwatch()..start();
  int result = wagnerFisherAlgorithm(s1, s2);
  stopwatch.stop();

  print('Редакционное расстояние: $result');
  print('Время выполнения: ${stopwatch.elapsedMilliseconds} мс');
}

int wagnerFisherAlgorithm(String s1, String s2) {
  if (s1.length > s2.length) {
    var temp = s1;
    s1 = s2;
    s2 = temp;
  }

  List<List<int>> matrix = List.generate(
    s2.length + 1,
    (i) => List.filled(s1.length + 1, 0),
  );

  for (int i = 0; i <= s1.length; i++) {
    matrix[0][i] = i;
  }

  for (int i = 0; i <= s2.length; i++) {
    matrix[i][0] = i;
  }

  for (int i = 1; i <= s2.length; i++) {
    for (int j = 1; j <= s1.length; j++) {
      if (s2[i - 1] == s1[j - 1]) {
        matrix[i][j] = matrix[i - 1][j - 1];
      } else {
        matrix[i][j] = 1 +
            [matrix[i - 1][j - 1], matrix[i - 1][j], matrix[i][j - 1]]
                .reduce((a, b) => a < b ? a : b);
      }
    }
  }

  return matrix[s2.length][s1.length];
}
