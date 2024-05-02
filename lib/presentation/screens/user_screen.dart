import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Users",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vectorstock.com%2Froyalty-free-vector%2Fprofile-icon-male-user-person-avatar-symbol-vector-20910837&psig=AOvVaw3XendD-y_yeSB08PahTFuh&ust=1714721846005000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPCXkOy67oUDFQAAAAAdAAAAABAJ"),
              ),
              title: Text("user${index + 1}"),
              subtitle: Text("email${index + 1}"),
            );
          },
        ),
      ),
    );
  }
}
