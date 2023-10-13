class Member {
  String name;
  String phoneNumber;
  String gender;
  List<Post> posts;
  List<Comment> comments;

  Member({this.name, this.phoneNumber, this.gender, this.posts, this.comments});

  void createPost(String content, List<String> images) {
    Post post = Post(content: content, images: images, member: this);
    posts.add(post);
  }

  void addComment(Post post, String content) {
    Comment comment = Comment(content: content, member: this, post: post);
    post.comments.add(comment);
    comments.add(comment);
  }
}

class Post {
  String content;
  List<String> images;
  DateTime date;
  Member member;
  List<Comment> comments;

  Post({this.content, this.images, this.member, this.comments}) {
    date = DateTime.now();
  }

  void addComment(Member member, String content) {
    Comment comment = Comment(content: content, member: member, post: this);
    comments.add(comment);
    member.comments.add(comment);
  }
}

class Comment {
  String content;
  DateTime date;
  Member member;
  Post post;

  Comment({this.content, this.member, this.post}) {
    date = DateTime.now();
  }
}

class SocialNetwork {
  List<Member> members;
  List<Post> posts;

  SocialNetwork({this.members, this.posts});

  void addMember(Member member) {
    members.add(member);
  }

  void addPost(Post post) {
    posts.add(post);
  }

  List<Post> searchPosts(String keyword) {
    List<Post> results = [];
    for (Post post in posts) {
      if (post.content.contains(keyword)) {
        results.add(post);
      }
    }
    return results;
  }
}
