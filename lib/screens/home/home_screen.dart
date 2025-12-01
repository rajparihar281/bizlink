import 'package:flutter/material.dart';
import '../../widgets/app_header.dart';
import '../../widgets/post_card.dart';
import '../../theme/colors.dart';
import '../../services/models/post_model.dart'; // Ensure you import your model

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // No BottomNavigationBar here anymore!
    return Scaffold(
      appBar: const AppHeader(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryRed,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: PostModel.getMockPosts().length,
        itemBuilder: (context, index) {
          final post = PostModel.getMockPosts()[index];
          return PostCard(userName: post.userName, content: post.content);
        },
      ),
    );
  }
}
