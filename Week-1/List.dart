import 'dart:io';

void main(List<String> arguments) {
  var arr = <int>[];
  var i = 0;
  
  while (i < 10) {
    stdout.write('Enter #${i+1}: ');
    var x = stdin.readLineSync();
    if (x == null) continue;
    var n = int.tryParse(x);
    if (n == null) continue;
    arr.add(n);
    i++;
  }
  print('\nMy numbers: $arr');
  arr.sort();
  print('\nSorted numbers: $arr');
  arr.sort((b, a) => a.compareTo(b));
  print('\nReverse Sorted numbers: $arr');
}