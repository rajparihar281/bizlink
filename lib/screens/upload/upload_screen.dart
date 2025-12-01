import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../theme/colors.dart';
import '../../services/api/api_service.dart';
import '../../utils/error_handler.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _fileName;
  bool _isUploading = false;
  final ApiService _apiService = ApiService();

  Future<void> _pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _isUploading = true;
      });

      File file = File(result.files.single.path!);

      try {
        // Upload to Backend
        // ignore: unused_local_variable
        String fileId = await _apiService.uploadFile(file, _fileName!);

        if (mounted) {
          ErrorHandler.showSuccess(context, "Upload Complete!");
          // Navigate to Dashboard/Result screen with the fileId
          // Navigator.pushNamed(context, '/dashboard', arguments: fileId);
        }
      } catch (e) {
        if (mounted) ErrorHandler.showError(context, "Upload Failed: $e");
      } finally {
        if (mounted) setState(() => _isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Data", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // ... Instruction Box ...
            const SizedBox(height: 40),

            GestureDetector(
              onTap: _isUploading ? null : _pickAndUploadFile,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryRed, width: 2),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF2A1A1F),
                ),
                child: _isUploading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryRed,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cloud_upload_outlined,
                            size: 60,
                            color: AppColors.primaryRed,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _fileName ?? "Tap to Choose File",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
