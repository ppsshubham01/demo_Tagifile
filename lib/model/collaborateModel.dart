class CollaborateModel {
  Data? data;

  CollaborateModel({
    this.data,
  });

  factory CollaborateModel.fromJson(Map<String, dynamic> json) {
    return CollaborateModel(
      data: json.containsKey('data') && json['data'] != null
          ? Data.fromJson(json['data'])
          : null,
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
      selfId: json['self_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groups': groups.map((group) => group.toJson()).toList(),
      'individuals': individuals.map((individual) => individual.toJson()).toList(),
      'self_id': selfId,
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
      groupName: json['group_name'],
      groupCategoryName: json['group_category_name'],
      groupDesc: json['group_desc'],
      groupRemark: json['group_remark'],
      id: json['_id'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      lastMessageActivity: DateTime.parse(json['last_message_activity']),
      members: (json['members'] as List).map((member) => member as int).toList(),
      unread: json['unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_name': groupName,
      'group_category_name': groupCategoryName,
      'group_desc': groupDesc,
      'group_remark': groupRemark,
      'id': id,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'last_message_activity': lastMessageActivity.toIso8601String(),
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
      firstName: json['first_name'],
      lastMessageActivity: DateTime.parse(json['last_message_activity']),
      lastName: json['last_name'],
      username: json['username'],
      id: json['_id'],
      unread: json['unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_message_activity': lastMessageActivity.toIso8601String(),
      'last_name': lastName,
      'username': username,
      '_id': id,
      'unread': unread,
    };
  }
}

