import 'package:flutter/material.dart';
import 'package:lamie_pro/core/constants/utils/constant.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10, top: 20),
          child: Column(
            children: [
              Hero(
                  tag: "serchfield",
                  child: SearchField(
                    fromUserpage: false,
                  )),
              Expanded(child: SerachedUserListWidget())
            ],
          ),
        ),
      ),
    );
  }
}
