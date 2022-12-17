import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('movie')) {
    dir = dir.replaceAll('movie', '');
  }
  return File('$dir/movie/test/$name').readAsStringSync();
}
