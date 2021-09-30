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
  static String detailForum(var id) => api + 'forum/detail/$id';
  static String unlikeForum(var id) => api + 'forum/unlike/$id';
  static String likeForum(var id) => api + 'forum/like/$id';
  //Diagnosa
  static final String showQuestion = api + 'diagnosa/show';
  static final String answer = api + 'diagnosa/diagnosaUser';

  //Challenge
  static final String insertChallenge = api + 'challenge/insert';
}
