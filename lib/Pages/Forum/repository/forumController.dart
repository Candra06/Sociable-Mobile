import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/Pages/Forum/repository/forumRepo.dart';

class ListForum {
  ForumRepository service = ForumRepository();

  Future<List<Forum>> getMyProducts() async {
    List<Forum> listForum = [];
    List<dynamic> tmpList = await service.listForum();

    // if (!res.error) {
    //   res.data.forEach((value) {
    //     listForum.add(value);
    //   });
    // }

    // print(res);
    // print(listForum[0].createdAt);
    return listForum;
  }
}
