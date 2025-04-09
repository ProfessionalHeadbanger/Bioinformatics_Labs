import 'dart:io';

Future<List<List<String>>> readMatrixFromFile(String filePath) async {
  List<String> lines = await File(filePath).readAsLines();
  return lines.map((line) => line.split(" ")).toList();
}

Future<void> main() async {
  List<List<String>> matrix = await readMatrixFromFile('bin\\input.txt');

  int rows = matrix.length;
  int cols = matrix[0].length;

  List<List<int>> count = List.generate(4, (_) => List.filled(cols, 0));
  String nucToInt = "ACGT";

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int index = nucToInt.indexOf(matrix[j][i]);
      if (index != -1) count[index][i]++;
    }
  }

  String consensus = "";
  for (int j = 0; j < cols; j++) {
    int maxCount = 0;
    String mostFrequent = "A";

    for (int i = 0; i < 4; i++) {
      if (count[i][j] > maxCount) {
        maxCount = count[i][j];
        mostFrequent = nucToInt[i];
      }
    }

    consensus += mostFrequent;
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int index = nucToInt.indexOf(matrix[i][j]);
      if (index != -1) {
        int maxCount =
            count.map((col) => col[j]).reduce((a, b) => a > b ? a : b);
        if (count[index][j] != maxCount) {
          matrix[i][j] = matrix[i][j].toLowerCase();
        }
      }
    }
  }

  print("Motifs:");
  for (var row in matrix) {
    print(row.join(" "));
  }

  print("\nCount(Motifs):");
  for (var i = 0; i < 4; i++) {
    print("${nucToInt[i]}: ${count[i].join(" ")}");
  }

  print("\nConsensus sequence:");
  print(consensus);
}
