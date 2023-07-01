import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

abstract interface class AssetsReader {
  Future<String> loadFile(List<String> path);
}

@LazySingleton(as:  AssetsReader)
class AssetsReaderImpl implements AssetsReader {
  @override
  Future<String> loadFile(List<String> path) async {
    return rootBundle.loadString(p.joinAll(['assets', ...path]));
  }
}
