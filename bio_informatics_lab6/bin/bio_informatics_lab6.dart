import 'dart:io';

Future<String> readFile(String filePath) async {
  return await File(filePath).readAsString();
}

List<MapEntry<String, int>> frequentWords(String str, int k) {
  Map<String, int> kmerCounts = {};
  int maxCount = 0;

  for (int i = 0; i <= str.length - k; i++) {
    String kmer = str.substring(i, i + k);
    kmerCounts[kmer] = (kmerCounts[kmer] ?? 0) + 1;
    maxCount = maxCount > kmerCounts[kmer]! ? maxCount : kmerCounts[kmer]!;
  }

  return kmerCounts.entries.where((entry) => entry.value == maxCount).toList();
}

Future<void> main() async {
  String text1 = await readFile('bin\\input1.txt');
  String text2 = await readFile('bin\\input2.txt');

  stdout.write("Введите значение k: ");
  int k = int.parse(stdin.readLineSync()!);

  List<MapEntry<String, int>> result1 = frequentWords(text1, k);
  List<MapEntry<String, int>> result2 = frequentWords(text2, k);

  print("\nНаиболее частые $k-меры в первой последовательности:");
  if (result1.isNotEmpty) {
    print("Количество вхождений: ${result1[0].value}");
    for (var entry in result1) {
      print(entry.key);
    }
  }

  print("\nНаиболее частые $k-меры во второй последовательности:");
  if (result2.isNotEmpty) {
    print("Количество вхождений: ${result2[0].value}");
    for (var entry in result2) {
      print(entry.key);
    }
  }
}
