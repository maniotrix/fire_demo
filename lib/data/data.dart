class Match_data {
  get_players_list(String match_id) {
    final Map players = {
      'batsmen': [
        "Shubman Gill",
        "Ishan Kishan",
        "Deepak Hooda",
        "Suryakumar Yadav",
        "Shreyas Iyer",
        "Reeza Hendricks",
        "David Miller",
        "Aiden Markram",
        "Rillee Rossouw",
        "Temba Bavuma",
      ],
      'bowlers': [
        "Washington Sundar",
        "Yuzvendra Chahal",
        "Kuldeep Yadav",
        "Arshdeep Singh",
        "Kagiso Rabada",
        "Anrich Nortje",
        "Tabraiz Shamsi",
        "Lungi Ngidi"
      ],
      'wicketkeepers': [
        "Sanju Samson",
        "Rishabh Pant",
        "Quinton de Kock",
        "Heinrich Klaasen"
      ],
      'allrounders': ["Ravindra Jadeja", "Hardik Pandya", "Wayne Parnell"],
    };

    return players;
  }

  List<String> get_home_page_data(String string) {
    final List<String> data = [];
    data.addAll([
      "india",
      "sa",
      "PENDING",
      "21-11-2022",
      "night",
      "South Africa Tour of India"
    ]);
    return data;
  }

  get_fantasy_points(String match_id) {}
}
