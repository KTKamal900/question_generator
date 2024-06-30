import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';

class FileHandler {
  // Makes this a singleton class, as we want only want a single
  // instance of this object for the whole application
  FileHandler._privateConstructor();

  static final FileHandler instance = FileHandler._privateConstructor();

  static File? _file;

  static const _fileName = 'user_file.txt';

  // Get the data file
  Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  // Initialize file
  Future<File> _initFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    if (kDebugMode) {
      print("$path / $_fileName}");
    }

    return File('$path/$_fileName');
  }

  static final Set<User> _userSet = {};

  Future<void> writeUser(User user) async {
    final File fl = await file;
    _userSet.add(user);

    // Now convert the set to a list as the jsonEncoder cannot encode
    // a set but a list.
    final userListMap = _userSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(userListMap));
  }

  Future<List<User>> readUsers() async {
    final File fl = await file;
    final content = await fl.readAsString();

    final List<dynamic> jsonData = jsonDecode(content);
    final List<User> users = jsonData
        .map(
          (e) => User.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    return users;
  }

  Future<void> deleteUser(User user) async {
    final File fl = await file;

    _userSet.removeWhere((e) => e == user);
    final userListMap = _userSet.map((e) => e.toJson()).toList();

    await fl.writeAsString(jsonEncode(userListMap));
  }

  Future<void> updateUser({
    required int id,
    required User updatedUser,
  }) async {
    _userSet.removeWhere((e) => e.id == updatedUser.id);
    await writeUser(updatedUser);
  }
}
