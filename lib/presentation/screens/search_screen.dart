import 'package:flutter/material.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10, top: 20),
          child: Column(
            children: [
              Hero(
                  tag: "serchfield",
                  child: CustomTextField(
                    isSearchField: true,
                    fromUserpage: false,
                  )),
              const Expanded(child: SerachedUserListWidget())
            ],
          ),
        ),
      ),
    );
  }
}
