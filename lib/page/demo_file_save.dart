import 'package:flutter/material.dart';

import '../db_handler/db_handler.dart';
import '../file_handler/file_handler.dart';
import '../models/user_model.dart';

class DemoFileSave extends StatefulWidget {
  const DemoFileSave({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DemoFileSave> createState() => _DemoFileSaveState();
}

class _DemoFileSaveState extends State<DemoFileSave> {
  final DatabaseHandler db = DatabaseHandler.instance;
  final FileHandler fileHandler = FileHandler.instance;
  List<User> userList = [];

  final User user1 = const User(
    id: 1,
    email: 'abc@example.com',
    name: 'Ram',
    phone: '1234567890',
    userAddress: Address(
      houseNo: '613',
      locality: 'RNT',
      city: 'Agartala',
      state: 'Tripura',
    ),
  );

  final User user2 = const User(
    id: 2,
    email: 'def@gmail.com',
    name: 'Shyam',
    phone: '9876543210',
    userAddress: Address(
      houseNo: '128',
      locality: 'RNT Block-2',
      city: 'Agartala',
      state: 'Tripura',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // final _users = await db.getUsers();
                  final users = await fileHandler.readUsers();
                  setState(() {
                    userList = users;
                  });
                },
                child: const Text('Get Users'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // await db.insert(user1);
                  // await db.insert(user2);
                  await fileHandler.writeUser(user1);
                  await fileHandler.writeUser(user2);
                },
                child: const Text('Insert Users'),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  User userUpdate = User(
                    id: user1.id,
                    email: user1.email,
                    name: 'Lakhan',
                    phone: user1.phone,
                    userAddress: user1.userAddress,
                  );

                  // await db.update(
                  //   user: _userUpdate,
                  //   whereColName: colId,
                  //   argument: user1.id,
                  // );
                  await fileHandler.updateUser(
                      id: userUpdate.id, updatedUser: userUpdate);
                },
                child: const Text('Update User'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // await db.delete(whereColName: colId, argument: user1.id);
                  await fileHandler.deleteUser(user1);
                },
                child: const Text('Delete User'),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: userList.map((e) => Text(e.toString())).toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
