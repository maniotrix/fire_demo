import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseWrapper {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(name, phone) {
    print("Trying to add user");
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': "a",
          'phone': "123456",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> addTeam(
      String team_num,
      String match_id,
      List<String> players,
      String c_name,
      String vc_name,
      List<String> wicketkeeper,
      List<String> batsmen,
      List<String> allrounders,
      List<String> bowlers) async {
    print("Trying to add team");

    final auth = FirebaseAuth.instance;
    CollectionReference teams = users
        .doc(auth.currentUser?.uid)
        .collection("Fantasy_Team")
        .doc(match_id)
        .collection("Teams");
    return teams
        .doc("${auth.currentUser?.email} Team$team_num")
        .set({
          'Captain': c_name,
          'Vice_Captain': vc_name,
          'Team': players,
          'Wicketkeepers': wicketkeeper,
          'Batsmen': batsmen,
          'Allrounders': allrounders,
          'Bowlers': bowlers,
        })
        .then((value) => print("Team Added"))
        .catchError((error) => print("Failed to add team: $error"));
  }

  Future<DocumentSnapshot> getContests(match_id) async {
    print("Trying to get contests");
    // Call the user's CollectionReference to add a new user
    final collection = FirebaseFirestore.instance.collection('Contest');
    return await collection.doc(match_id).get();
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist2");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}
