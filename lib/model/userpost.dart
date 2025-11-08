import 'package:coretico_socialmedia/model/usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  String numcomments;
  final String numshare;
  bool isLiked;
  int likeCount;
  List<Usercomment> comments = [];

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshare,
    required this.isLiked,
    this.likeCount = 0,
  });

  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likeCount++;
    } else {
      likeCount--;
      if (likeCount < 0) likeCount = 0;
    }
  }

  void addComment(Usercomment comment) {
    comments.add(comment);
    numcomments = comments.length.toString();
  }
}
