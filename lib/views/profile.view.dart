import 'package:flutter/material.dart';
import 'package:coretico_socialmedia/model/usercomment.dart';
import 'package:coretico_socialmedia/model/userdata.dart';
import 'package:coretico_socialmedia/model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});
  final Userpost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController commentController = TextEditingController();
  late Userdata userData;

  @override
  void initState() {
    super.initState();
    userData = Userdata(); // Assuming you have sample data
  }

  var nametxtstyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldTxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  var boldTxtStyle1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // ✅ Each comment display
  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(userComment.commenterTime,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(width: 15),
            const Text('Like',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(width: 15),
            const Text('Reply',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      );

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userComment.commenterName, style: boldTxtStyle),
            const SizedBox(height: 5),
            Text(userComment.commenterContent),
          ],
        ),
      );

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomment userComment) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
        ),
      );

  Widget usercommenterline(Usercomment userComment) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commenterPic(userComment),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commentSpace(userComment),
                commentBtn(userComment),
              ],
            ),
          ),
        ],
      );

  Widget userpostdetails(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: usercommenterline(userComment),
      );

  Widget commenters(Userpost userpost) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text('${userpost.comments.length}',
                    style: boldTxtStyle.copyWith(fontSize: 16)),
                const SizedBox(width: 5),
                const Text('All comments', style: TextStyle(fontSize: 16)),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      );

  Widget buttons(Userpost userpost) => Column(
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        userpost.isLiked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      userpost.isLiked = !userpost.isLiked;
                    });
                  },
                  icon: const Icon(Icons.thumb_up, size: 20),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget userline(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(userpost.userimg),
              radius: 20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userpost.username, style: nametxtstyle),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(userpost.time),
                  const Text(' • '),
                  const Icon(Icons.group, size: 15, color: Colors.grey),
                ],
              ),
            ],
          )
        ],
      );

  Widget postimage(Userpost userpost) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userpost.postcontent),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                userpost.postimg,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );

  Widget commentInput(Userpost userpost) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(userData.userList[0].userimg),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: () {
                if (commentController.text.trim().isNotEmpty) {
                  setState(() {
                    userpost.comments.add(Usercomment(
                      commenterImg: userData.userList [0].userimg,
                      commenterName: userData.userList [0].username,
                      commenterTime: 'Now',
                      commenterContent: commentController.text.trim(),
                    ));
                    commentController.clear();
                  });
                }
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 243, 246),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                userline(widget.userPost),
                postimage(widget.userPost),
                buttons(widget.userPost),
                commenters(widget.userPost),
                ...widget.userPost.comments
                    .map((userComment) => userpostdetails(userComment)),
              ],
            ),
          ),
          commentInput(widget.userPost), // ✅ input bar at bottom
        ],
      ),
    );
  }
}
