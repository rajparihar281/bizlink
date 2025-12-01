import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart'; // For MediaType if needed

class ApiService {
  // Replace with your actual backend URL (use 10.0.2.2 for Android emulator)
  static const String baseUrl = "http://10.0.2.2:8000";
  static String? _authToken; // In-memory token storage for session

  // --- Auth Endpoints (Day 1) ---

  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _authToken = data['token']; // Store token
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['detail'] ?? 'Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signup(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final resData = jsonDecode(response.body);
        _authToken = resData['token'];
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['detail'] ?? 'Signup failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  // --- File Endpoints (Day 2) ---

  Future<String> uploadFile(File file, String filename) async {
    if (_authToken == null) throw Exception("Not authenticated");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/files/upload'),
    );
    request.headers['Authorization'] = 'Bearer $_authToken';

    request.files.add(
      await http.MultipartFile.fromPath('file', file.path, filename: filename),
    );

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['fileId']; // Return ID for polling
    } else {
      throw Exception("Upload failed: ${response.statusCode}");
    }
  }

  // --- AI Status & Results (Day 3 & 4) ---

  Future<String> getFileStatus(String fileId) async {
    if (_authToken == null) throw Exception("Not authenticated");

    final response = await http.get(
      Uri.parse('$baseUrl/files/status/$fileId'),
      headers: {'Authorization': 'Bearer $_authToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(
        response.body,
      )['status']; // e.g., "processing", "completed"
    }
    return "unknown";
  }

  Future<Map<String, dynamic>> getAiResult(String fileId) async {
    if (_authToken == null) throw Exception("Not authenticated");

    final response = await http.get(
      Uri.parse('$baseUrl/ai/result/$fileId'),
      headers: {'Authorization': 'Bearer $_authToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to fetch results");
    }
  }
}
