class CollaborateModel {
  Data? data;

  CollaborateModel({
    this.data,
  });

  factory CollaborateModel.fromJson(Map<String, dynamic> json) {
    return CollaborateModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      groups: (json['groups'] as List)
          .map((group) => Group.fromJson(group))
          .toList(),
      individuals: (json['individuals'] as List)
          .map((individual) => Individual.fromJson(individual))
          .toList(),
      selfId: json['selfId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groups': groups.map((group) => group.toJson()).toList(),
      'individuals': individuals.map((individual) => individual.toJson()).toList(),
      'selfId': selfId,
    };
  }
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

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupName: json['groupName'],
      groupCategoryName: json['groupCategoryName'],
      groupDesc: json['groupDesc'],
      groupRemark: json['groupRemark'],
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      lastMessageActivity: DateTime.parse(json['lastMessageActivity']),
      members: (json['members'] as List).map((member) => member as int).toList(),
      unread: json['unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
      'groupCategoryName': groupCategoryName,
      'groupDesc': groupDesc,
      'groupRemark': groupRemark,
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'lastMessageActivity': lastMessageActivity.toIso8601String(),
      'members': members,
      'unread': unread,
    };
  }
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

  factory Individual.fromJson(Map<String, dynamic> json) {
    return Individual(
      firstName: json['firstName'],
      lastMessageActivity: DateTime.parse(json['lastMessageActivity']),
      lastName: json['lastName'],
      username: json['username'],
      id: json['id'],
      unread: json['unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastMessageActivity': lastMessageActivity.toIso8601String(),
      'lastName': lastName,
      'username': username,
      'id': id,
      'unread': unread,
    };
  }
}

