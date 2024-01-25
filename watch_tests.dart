import 'dart:io';

import 'package:watcher/watcher.dart';

void main() {
  final watcher = DirectoryWatcher('lib');
  final testWatcher = DirectoryWatcher('test');

  print('Watching changes in lib/ and test/ directories...');

  watcher.events.listen((event) {
    print('File changed: ${event.path}');
    runTests();
  });

  testWatcher.events.listen((event) {
    print('Test file changed: ${event.path}');
    runTests();
  });
}

void runTests() {
  print('Running tests...');
  Process.run('flutter', ['test']).then((ProcessResult results) {
    print(results.stdout);
    print(results.stderr);
  });
}
