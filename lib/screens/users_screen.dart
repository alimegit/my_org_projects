import 'package:default_project/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../data/model/users_model.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: context.watch<UsersViewModel>().users.isNotEmpty
          ? ListView(
              children: [
                ...List.generate(
                  context.watch<UsersViewModel>().users.length,
                  (index) {
                    UsersModel userModel = context.watch<UsersViewModel>().users[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        leading: Image.network(
                          userModel.avatar_url,
                        ),
                        title: Text(userModel.name),
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
