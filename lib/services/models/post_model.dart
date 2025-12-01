class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String content;
  final int likes;
  final int comments;
  final String timestamp;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.content,
    this.likes = 0,
    this.comments = 0,
    required this.timestamp,
  });

  // Mock data generator for the UI
  static List<PostModel> getMockPosts() {
    return [
      PostModel(
        id: '1',
        userId: 'u1',
        userName: 'John Doe',
        content: 'Just launched my new Flutter project! 🚀 #BizLink',
        likes: 12,
        comments: 4,
        timestamp: '2h ago',
      ),
      PostModel(
        id: '2',
        userId: 'u2',
        userName: 'Sarah Smith',
        content: 'Looking for a backend developer for a startup. DM me!',
        likes: 45,
        comments: 10,
        timestamp: '5h ago',
      ),
      PostModel(
        id: '3',
        userId: 'u3',
        userName: 'Mike Ross',
        content:
            'Flutter 3.0 is amazing. The performance improvements are real.',
        likes: 89,
        comments: 22,
        timestamp: '1d ago',
      ),
    ];
  }
}
