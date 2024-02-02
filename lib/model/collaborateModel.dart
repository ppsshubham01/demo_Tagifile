


class CollaborateModel {
  Data? data;

  CollaborateModel({
    this.data,
    //is this required or not..!
  });

}

class Data {
  List<Group> groups;
  List<Individual> individuals;
  int selfId;

  Data({
    required this.groups,
    required this.individuals,
    required this.selfId,
  });
}

class Group {
  String groupName;
  String groupCategoryName;
  String groupDesc;
  String groupRemark;
  int id;
  String username;
  String firstName;
  String lastName;
  DateTime lastMessageActivity;
  List<int> members;
  int unread;

  Group({
    required this.groupName,
    required this.groupCategoryName,
    required this.groupDesc,
    required this.groupRemark,
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.lastMessageActivity,
    required this.members,
    required this.unread,
  });

}

class Individual {
  String firstName;
  DateTime lastMessageActivity;
  String lastName;
  String username;
  int id;
  int unread;

  Individual({
    required this.firstName,
    required this.lastMessageActivity,
    required this.lastName,
    required this.username,
    required this.id,
    required this.unread,
  });

}
