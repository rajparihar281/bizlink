import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ConnectButton extends StatefulWidget {
  const ConnectButton({super.key});

  @override
  State<ConnectButton> createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isConnected ? Colors.grey[800] : AppColors.primaryRed,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {
        setState(() => isConnected = !isConnected);
        if (isConnected) {
          // Trigger "Connection Sent" popup logic here if needed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Connection Sent!"),
              duration: Duration(seconds: 1),
              backgroundColor: AppColors.primaryRed,
            ),
          );
        }
      },
      child: Text(isConnected ? "Pending" : "Connect"),
    );
  }
}
