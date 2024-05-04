import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: Column(
            children: [
              Hero(
                  tag: "serchfield",
                  child: CustomTextField(
                    isSearchField: true,
                    fromUserpage: true,
                  )),
              const Expanded(
                child: UserListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
