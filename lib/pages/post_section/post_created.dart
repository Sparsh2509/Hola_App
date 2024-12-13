import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:hola_app/constants/postapi.dart';

class PostCreated extends StatefulWidget {
  @override
  _PostCreatedState createState() => _PostCreatedState();
}

class _PostCreatedState extends State<PostCreated> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = apiService.fetchPosts();
  }

  // Future<void> _sharePost(String title, String body) async {
  //   await FlutterShare.share(
  //     title: title,
  //     text: body,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No posts found."));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (post['imageUrl'] != null)
                      Image.network(post['imageUrl'], fit: BoxFit.cover),
                    ListTile(
                      title: Text(post['title'] ?? 'No Title'),
                      subtitle: Text(post['body'] ?? 'No Content'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up),
                          onPressed: () async {
                            await apiService.likePost(post['_id']);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Liked post!")),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () async {
                            final comment = await showDialog<String>(
                              context: context,
                              builder: (context) => _CommentDialog(),
                            );
                            if (comment != null && comment.isNotEmpty) {
                              await apiService.addComment(post['_id'], comment);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Comment added!")),
                              );
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.share), onPressed: () {  },
                          // onPressed: () => _sharePost(post['title'], post['body']),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CommentDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add a Comment"),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: "Write your comment here..."),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: Text("Submit"),
        ),
      ],
    );
  }
}