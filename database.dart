import 'package:firebase_database/firebase_database.dart';
import 'post.dart';
import 'userData.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Post post) {
  var id = databaseReference.child('/posts').push();
  id.set(post.toJson());
  return id;
}

DatabaseReference addUser(UserData user) {
  var id = databaseReference.child('/users').push();
  id.set(user.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference id) {
  id.update(post.toJson());
}

Future<List<Post>> getAllPosts() async {
  DataSnapshot dataSnapshot = await databaseReference.child('posts/').once();
  List<Post> posts = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Post post = createPost(value);
      post.setId(databaseReference.child('posts/' + key));
      posts.add(post);
    });
  }

  return posts;
}

Future<Set> getAllUid() async {
  DataSnapshot dataSnapshot = await databaseReference.child('users/').once();

  Set uid = {};

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((uid, value) {
      var uid = value;
      uid.add(uid);
    });
  }

  return uid;
}

Future<Set> getAllUsers() async {
  DataSnapshot dataSnapshot = await databaseReference.child('users/').once();

  Set users = {};

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      UserData user = createUser(value);
      user.setId(databaseReference.child('users/' + key));
      users.add(user);
    });
  }

  return users;
}
