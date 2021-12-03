void main() {
  String input = '''31323334
  35363738
  39717765
  72747975''';

  List<String> lines = input.split('\n');
  List<List<String>> matrix = [];
  List<String> output = [];
  for (String line in lines) {
    var num = line.split('');
    for (int i = 0; i < num.length; i = i + 2) {
      output.add('${num[i]}${num[i + 1]}');
    }
  }
  print(output);
}
