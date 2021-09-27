class EndPoint {
  static final String server = 'https://techify.reach.my.id/';
  static final String api = server + 'api/';
  static final String login = api + 'login';
  static final String getArtikel = api + 'artikel';
  static final String listForum = api + 'forum/all';
  static String detailForum(var id) => api + 'forum/detail/$id';
}
