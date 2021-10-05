class EndPoint {
  static final String server = 'https://techify.reach.my.id/';
  static final String api = server + 'api/';
  static final String login = api + 'login';
  static final String register = api + 'signup';
  static final String getArtikel = api + 'artikel';
  static final String createChallenge = api + 'challenge/insert';
  static String detailKonten(var id) => api + 'artikel/$id';
  static final String listForum = api + 'forum/all';
  static final String addForum = api + 'forum/post';
  static final String historyForum = api + 'forum/history';
  static String detailForum(var id) => api + 'forum/detail/$id';

  static String unlikeForum(var id) => api + 'forum/unlike/$id';
  static String likeForum(var id) => api + 'forum/like/$id';



  // Membership
  static final String getMember = api + 'membership/get';
  static final String post = api + 'membership/store';

  //Diagnosa
  static final String showQuestion = api + 'diagnosa/show';
  static final String answer = api + 'diagnosa/diagnosaUser';

  //Challenge
  static final String insertChallenge = api + 'challenge/insert';
  static final String showChallenge = api + 'challenge/show';
  static String detailChallenge(String id) => api + 'challenge/detail/$id';
  static String finishChallenge(String id) => api + 'challenge/finish/$id';

  static String comment(var id) => api + 'forum/reply/$id';

  //Konsultasi
  static final String listPsikolog = api + 'konsultasi/listPsikolog';
  static final String lsitRoom = api + 'konsultasi/room';
  static final String createChat = api + 'konsultasi/store';
  static String detailChat(String id) => api + 'konsultasi/detail/$id';
}
