import 'package:flutter/material.dart';
import '../theme/colors.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String content;

  const PostCard({super.key, required this.userName, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1A1F), // Slightly lighter than background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryRed.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.grey, radius: 20),
              const SizedBox(width: 10),
              Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10),
          Text(content, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 15),
          // Like / Comment / Share Logic (UI Only) [cite: 37]
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.thumb_up_outlined, color: Colors.white60),
              Icon(Icons.comment_outlined, color: Colors.white60),
              Icon(Icons.share_outlined, color: Colors.white60),
            ],
          )
        ],
      ),
    );
  }
}