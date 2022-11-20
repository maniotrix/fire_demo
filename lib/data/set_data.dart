import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_demo/firebase_wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

late List<bool> _color = List.filled(100, false, growable: true);

class Set_Data {
  Future<List> get_joined_teams_ref(String match_id) async {
    final collection = FirebaseFirestore.instance
        .collection('Contest')
        .doc(match_id)
        .collection("Teams")
        .get();

    return collection.then((value) {
      final refs = [];
      for (var doc in value.docs) {
        Map<String, dynamic> data = doc.data();
        var fooValue = data['Team'];
        refs.add(fooValue); // <-- Retrieving the value.
      }
      return refs;
    });
  }

  Future<String> get_joined_teams_num(String match_id) async {
    final collection = FirebaseFirestore.instance
        .collection('Contest')
        .doc(match_id)
        .collection("Teams")
        .get();

    return collection.then((value) {
      return value.docs.length.toString();
    });
  }

  Future<List> get_joined_contest() async {
    final auth = FirebaseAuth.instance;
    final user = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();

    return user.then((value) {
      final contests = [];
      if (value.exists) {
        Map<String, dynamic> data = value.data()!;

        // You can then retrieve the value from the Map like this:
        contests.addAll(data['contest joined']);
      }

      return contests;
    });
  }

  Future<List> get_user_data() async {
    final auth = FirebaseAuth.instance;
    final user = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .get();

    return user.then((value) {
      final contests = [];
      if (value.exists) {
        Map<String, dynamic> data = value.data()!;

        // You can then retrieve the value from the Map like this:
        contests.addAll([data['name'], data['phone']]);
      }

      return contests;
    });
  }

  Future<String> get_team_num(String match_id) async {
    final auth = FirebaseAuth.instance;
    final teams = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection("Fantasy_Team")
        .doc(match_id)
        .collection("Teams")
        .get();
    return teams.then((value) {
      return (value.docs.length + 1).toString();
    });
  }

  Future set_team_data(
      String team_num,
      String match_id,
      List<String> players,
      String c_name,
      String vc_name,
      List<String> wicketkeeper,
      List<String> batsmen,
      List<String> allrounders,
      List<String> bowlers) async {
    await FirebaseWrapper().addTeam(team_num, match_id, players, c_name,
        vc_name, wicketkeeper, batsmen, allrounders, bowlers);
  }
}
