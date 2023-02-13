import 'package:v2exf/model/base.dart';

class Node extends BaseModel {
  String? avatarLarge;
  String? name;
  String? avatarNormal;
  String? title;
  String? url;
  int? topics;
  String? footer;
  String? header;
  String? titleAlternative;
  String? avatarMini;
  int? stars;
  List? aliases;
  bool? root;
  int? id;
  String? parentNodeName;

  Node.fromJson(Map<String, dynamic> data) : super.fromJson(data) {
    avatarLarge = data["avatar_large"];
    name = data["name"];
    avatarNormal = data["avatar_normal"];
    title = data["title"];
    url = data["url"];
    topics = data["topics"];
    footer = data["footer"];
    header = data["header"];
    titleAlternative = data["title_alternative"];
    avatarMini = data["avatar_mini"];
    stars = data["stars"];
    aliases = data["aliases"];
    root = data["root"];
    id = data["id"];
    parentNodeName = data["parent_node_name"];
  }
}
