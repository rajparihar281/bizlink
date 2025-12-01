import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/typography.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // --- Logout Functionality ---
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF2A1A1F), // Matches the dark card theme
        title: const Text("Logout", style: TextStyle(color: Colors.white)),
        content: const Text(
          "Are you sure you want to log out?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx), // Close dialog
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Close dialog first

              // CRITICAL: Remove all screens from stack and go to Login
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading:
            false, // Hide back button since we are in a tab view
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryRed,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text("Jhon Doe", style: AppTypography.headlineMedium),
            Text(
              "Flutter Developer",
              style: AppTypography.bodyRegular.copyWith(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("Connections", "120"),
                _buildStat("Posts", "15"),
                _buildStat("Views", "1.2k"),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(color: Colors.white24, thickness: 0.5),

            // Settings List
            _buildProfileOption(Icons.settings, "Settings", () {
              // Navigate to Settings
            }),
            _buildProfileOption(Icons.history, "Activity History", () {
              // Navigate to History
            }),
            _buildProfileOption(Icons.help_outline, "Help & Support", () {
              // Navigate to Help
            }),

            // Logout Option connected to function
            _buildProfileOption(
              Icons.logout,
              "Logout",
              () => _handleLogout(context), // Call the function here
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String count) {
    return Column(
      children: [
        Text(count, style: AppTypography.headlineMedium.copyWith(fontSize: 20)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // Updated to accept onTap callback
  Widget _buildProfileOption(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.white70),
      title: Text(
        title,
        style: TextStyle(color: isDestructive ? Colors.red : Colors.white),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white24,
        size: 16,
      ),
      onTap: onTap, // Function executes when tapped
    );
  }
}
