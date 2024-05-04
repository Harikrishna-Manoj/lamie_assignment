import 'package:flutter/material.dart';
import 'package:lamie_pro/presentation/widgets/widgets.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.receiverId, required this.username});
  final int receiverId;
  final String username;

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_circle_left_rounded,
              size: 35,
            )),
        actions: [
          Text(
            username,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 10,
          ),
          Hero(
            tag: "profile$receiverId",
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage("asset/images/profile.png"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: MessageList(
                receiverId: receiverId,
              ),
            ),
            Hero(
              tag: "serchfield",
              child: CustomTextField(
                messageController: messageController,
                fromUserpage: false,
                isSearchField: false,
                receiverId: receiverId,
              ),
            )
          ],
        ),
      ),
    );
  }
}
