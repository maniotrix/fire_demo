import 'package:fire_demo/firebase_wrapper.dart';

class Set_Data {
  get_joined_teams_ref(String match_id) {}

  get_joined_teams_num(String match_id) {}

  get_joined_contest() {}

  get_user_data() {}

  get_team_num(String match_id) {
    return "01";
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
    await FirebaseWrapper().addTeam(team_num, match_id, players, c_name, vc_name,
        wicketkeeper, batsmen, allrounders, bowlers);
  }
}
