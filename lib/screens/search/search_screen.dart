import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Find Connections", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Search Bar [cite: 44]
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search users...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: AppColors.primaryRed),
                filled: true,
                fillColor: const Color(0xFF2A1A1F),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.grey),
                  title: Text("User $index", style: const TextStyle(color: Colors.white)),
                  subtitle: const Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRed,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      // Connection Sent Popup [cite: 47]
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Connection Sent!"), backgroundColor: AppColors.primaryRed),
                      );
                    },
                    child: const Text("Connect", style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}