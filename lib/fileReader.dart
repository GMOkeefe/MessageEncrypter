import 'dart:io';

final filename = 'pass.txt';

// this file is mainly for these test cases
// not really relevant for general use

void sendData(String data)
{
  var passFile = File(filename);
  
  passFile.writeAsStringSync(data);
}

String loadData()
{
  var passFile = File(filename);

  var data = passFile.readAsStringSync();

  return data;
}
