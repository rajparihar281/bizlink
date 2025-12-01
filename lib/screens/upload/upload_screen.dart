import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // 
import '../../theme/colors.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name; // [cite: 55]
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Upload Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Instruction Box [cite: 57]
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "How BizLink processes your data: We encrypt your files before storage.",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 40),
            
            // Upload UI: Cloud Icon + Card [cite: 53]
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryRed, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF2A1A1F),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_upload_outlined, size: 60, color: AppColors.primaryRed),
                    const SizedBox(height: 10),
                    Text(
                      _fileName ?? "Choose File", // [cite: 54]
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}