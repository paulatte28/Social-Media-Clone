import 'package:coretico_socialmedia/model/userdata.dart';
import 'package:coretico_socialmedia/model/userpost.dart';
import 'package:coretico_socialmedia/model/usercomment.dart';
import 'package:coretico_socialmedia/views/profile.view.dart';
import 'package:flutter/material.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});
  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  int likeCount(Userpost userpost) => userpost.isLiked ? 1 : 0;

  Widget buttons(Userpost userpost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: (userpost.isLiked) ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                userpost.isLiked = !userpost.isLiked;
              });
            },
            icon: const Icon(Icons.thumb_up_alt_outlined),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {
              showCommentDialog(userpost);
            },
            icon: const Icon(Icons.mode_comment_outlined),
            label: const Text('Comment'),
          ),
        ],
      );

  Widget postCount(Userpost userpost) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LEFT SIDE: like count with thumbs-up icon circle
            Row(
              children: [
                if (likeCount(userpost) > 0) ...[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(Icons.thumb_up,
                        size: 10, color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${likeCount(userpost)} ${likeCount(userpost) == 1 ? 'Like' : 'Likes'}',
                    style:
                        const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ],
            ),

            // RIGHT SIDE: comments + shares
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showCommentDialog(userpost); // same as bottom comment
                  },
                  child: Text(
                    '${userpost.comments.length} ${userpost.comments.length == 1 ? 'Comment' : 'Comments'}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${userpost.numshare} ${int.tryParse(userpost.numshare) == 1 ? 'Share' : 'Shares'}',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );

  Widget postImage(Userpost userpost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userpost.postimg),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userpost.userimg),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userpost.username, style: nametxtStyle),
              Row(
                children: [
                  Text('${userpost.time} · ',
                      style: const TextStyle(color: Colors.grey)),
                  const Icon(Icons.people, size: 16, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      );

  Widget showPost(Userpost userpost) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postHeader(userpost),
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(userpost.postcontent,
                style: const TextStyle(fontSize: 15)),
          ),
          postImage(userpost),
          postCount(userpost),
          const Divider(height: 1),
          buttons(userpost),
          const Divider(height: 10),
          showComments(userpost),
          const SizedBox(height: 10),
        ],
      );

  Widget showComments(Userpost userpost) {
    if (userpost.comments.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: userpost.comments
          .map((comment) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                leading: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(comment.commenterImg),
                ),
                title: Text(comment.commenterName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(comment.commenterContent),
                trailing: Text(comment.commenterTime,
                    style: const TextStyle(fontSize: 12)),
              ))
          .toList(),
    );
  }

  void showCommentDialog(Userpost userpost) {
    TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: TextField(
          controller: commentController,
          decoration:
              const InputDecoration(hintText: 'Write a comment...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                setState(() {
                  userpost.comments.add(Usercomment(
                    commenterImg: 'assets/images/default_user.png',
                    commenterName: widget.userdata.userList[0].username,
                    commenterTime: 'Now',
                    commenterContent: commentController.text,
                  ));
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.userdata.userList.map((UserPost) {
          return InkWell(
            onTap: () {
              gotoPage(context, ProfileView(userPost: UserPost));
            },
            child: showPost(UserPost),
          );
        }).toList(),
      ),
    );
  }
}
