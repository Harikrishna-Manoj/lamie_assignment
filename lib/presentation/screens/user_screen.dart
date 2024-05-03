import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lamie_pro/presentation/screens/search_screen.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Users",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10),
          child: Column(
            children: [
              Hero(
                  tag: "serchfield",
                  child: SearchField(
                    fromUserpage: true,
                  )),
              Expanded(
                child: UserListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
