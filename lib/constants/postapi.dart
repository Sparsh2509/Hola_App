import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://snapverse-6nqx.onrender.com";

  // Fetch posts
  Future<List<dynamic>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/posts"));
      if (response.statusCode == 20) {
        return jsonDecode(response.body); // Returns a list of posts
      } else {
        throw Exception("Failed to load posts.");
      }
    } catch (e) {
      throw Exception("Error fetching posts: $e");
    }
  }

  // Add like to a post
  Future<void> likePost(String postId) async {
    try {
      final response = await http.post(Uri.parse("$baseUrl/posts/$postId/like"));
      if (response.statusCode != 200) {
        throw Exception("Failed to like post.");
      }
    } catch (e) {
      throw Exception("Error liking post: $e");
    }
  }

  // Add a comment to a post
  Future<void> addComment(String postId, String comment) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/posts/$postId/comment"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"comment": comment}),
      );
      if (response.statusCode != 201) {
        throw Exception("Failed to add comment.");
      }
    } catch (e) {
      throw Exception("Error adding comment: $e");
    }
  }

  createPost(Map<String, String> postData) {}
}

Future<void> createPost(Map<String, dynamic> postData) async {
  final uri = Uri.parse("/posts");
  

  try {
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(postData),
    );

    if (response.statusCode == 201) {
      print("Post created successfully: ${response.body}");
    } else {
      throw Exception("Failed to create post. Status code: ${response.statusCode}, Response: ${response.body}");
    }
  } catch (e) {
    print("Error in createPost: $e");
    rethrow; // Pass the exception back to the caller for handling
  }
}