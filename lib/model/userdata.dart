import 'package:coretico_socialmedia/model/account.dart';
import 'package:coretico_socialmedia/model/friend.dart';
import 'package:coretico_socialmedia/model/usercomment.dart';
import 'package:coretico_socialmedia/model/userpost.dart';

class Userdata {
  List<Userpost> userList =[

    Userpost(
      userimg: 'assets/person1.jpg',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'Had a great day at the beach!',
      postimg: 'assets/pavlova.png',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/person2.jpg',
      username: 'Kento Yamamoto',
      time: '3 hrs ago',
      postcontent: 'Danggg, love this pavlova!',
      postimg: 'assets/pavlova_australian.jpg',
      numcomments: '24',
      numshare: '5',
      isLiked: false,
    ),

    Userpost(
      userimg: 'assets/person3.jpg',
      username: 'Cypups Doggo',
      time: '10 hrs ago',
      postcontent: 'Just baked this pavlova, looks delicious!',
      postimg: 'assets/pavlova.png',
      numcomments: '30',
      numshare: '20',
      isLiked: true,
    ),

    Userpost(
      userimg: 'assets/person4.jpg',
      username: 'Russel Crowe',
      time: '11 hrs ago',
      postcontent: 'So proud of my new pavlova recipe!',
      postimg: 'assets/pavlova.png',
      numcomments: '24',
      numshare: '5',
      isLiked: true,
    ),
  ];
  List<Friend> friendList = [
    Friend(img: 'assets/person1.jpg', name: 'John Doe'),
    Friend(img: 'assets/person2.jpg', name: 'Kento Yamamoto'),
    Friend(img: 'assets/person3.jpg', name: 'Cypups Doggo'),
    Friend(img: 'assets/person4.jpg', name: 'Russel Crowe'),
    Friend(img: 'assets/person5.jpg', name: 'Emma Stone'),
    Friend(img: 'assets/person6.jpg', name: 'Chris Evans'),
  ];

  List<Usercomment> commentList = [
    Usercomment(commenterImg: 'assests/person2.jpg', 
                commenterName: 'Barbara Palvin', 
                commenterTime: '1 hr ago', 
                commenterContent: 'Looks delicious!'),
    Usercomment(commenterImg: 'assests/person3.jpg', 
                commenterName: 'Leo Messi', 
                commenterTime: '2 hrs ago', 
                commenterContent: 'Ayeeee, Lets G!'),
    Usercomment(commenterImg: 'assests/person4.jpg', 
                commenterName: 'Zlatan Ibrahimovic', 
                commenterTime: '5 hrs ago', 
                commenterContent: 'Dawg, that looks tasty!'),
  ];

  Account myUserAccount = Account(
    name: 'Kristine Paula Coretico',
    email: 'krispau123@gmail.com',
    img: 'assets/person2.jpg',
    numFollowers: '1.6m',
    numPosts: '239',
    numFollowing: '0',
    numFriends: '10');

}