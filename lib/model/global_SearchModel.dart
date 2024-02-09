

class GlobalSearch {
  List<User>? users;
  List<dynamic>? groups;
  List<Chat>? chats;
  dynamic tags;
  Content? content;
  List<dynamic>? organisations;
  int? totalUsers;
  int? totalGroups;
  int? totalOrg;
  int? totalContents;
  int? totalChats;
  dynamic orgId;
  dynamic resultantTotalCount;

  GlobalSearch({
    this.users,
    this.groups,
    this.chats,
    this.tags,
    this.content,
    this.organisations,
    this.totalUsers,
    this.totalGroups,
    this.totalOrg,
    this.totalContents,
    this.totalChats,
    this.orgId,
    this.resultantTotalCount,
  });

  factory GlobalSearch.fromJson(Map<String, dynamic> json) {
    return GlobalSearch(
      users: (json['users'] as List<dynamic>?)
          ?.map((user) => User.fromJson(user))
          .toList(),
      groups: json['groups'],
      chats: (json['chats'] as List<dynamic>?)
          ?.map((chat) => Chat.fromJson(chat))
          .toList(),
      tags: json['tags'],
      content: json['content'] != null ? Content.fromJson(json['content']) : null,
      organisations: json['organisations'],
      totalUsers: json['totalUsers'],
      totalGroups: json['totalGroups'],
      totalOrg: json['totalOrg'],
      totalContents: json['totalContents'],
      totalChats: json['totalChats'],
      orgId: json['orgId'],
      resultantTotalCount: json['resultantTotalCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users?.map((user) => user.toJson()).toList(),
      'groups': groups,
      'chats': chats?.map((chat) => chat.toJson()).toList(),
      'tags': tags,
      'content': content?.toJson(),
      'organisations': organisations,
      'totalUsers': totalUsers,
      'totalGroups': totalGroups,
      'totalOrg': totalOrg,
      'totalContents': totalContents,
      'totalChats': totalChats,
      'orgId': orgId,
      'resultantTotalCount': resultantTotalCount,
    };
  }
}


class Chat {
  int messageId;
  int messageFromId;
  int messageToId;
  String messageBody;
  bool isAttachment;
  bool inGroup;
  int orgId;
  dynamic name;
  String username;
  DateTime createDate;
  String firstName;
  String lastName;
  dynamic groupName;
  dynamic groupRemark;
  int senderId;
  dynamic groupDesc;
  dynamic groupCategoryName;
  List<Attachment>? attachment;
  dynamic highlight;
  bool isForwarded;

  Chat({
    required this.messageId,
    required this.messageFromId,
    required this.messageToId,
    required this.messageBody,
    required this.isAttachment,
    required this.inGroup,
    required this.orgId,
    required this.name,
    required this.username,
    required this.createDate,
    required this.firstName,
    required this.lastName,
    required this.groupName,
    required this.groupRemark,
    required this.senderId,
    required this.groupDesc,
    required this.groupCategoryName,
    required this.attachment,
    required this.highlight,
    required this.isForwarded,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      messageId: json['messageId'],
      messageFromId: json['messageFromId'],
      messageToId: json['messageToId'],
      messageBody: json['messageBody'],
      isAttachment: json['isAttachment'],
      inGroup: json['inGroup'],
      orgId: json['orgId'],
      name: json['name'],
      username: json['username'],
      createDate: DateTime.parse(json['createDate']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      groupName: json['groupName'],
      groupRemark: json['groupRemark'],
      senderId: json['senderId'],
      groupDesc: json['groupDesc'],
      groupCategoryName: json['groupCategoryName'],
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((attachment) => Attachment.fromJson(attachment))
          .toList(),
      highlight: json['highlight'],
      isForwarded: json['isForwarded'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'messageFromId': messageFromId,
      'messageToId': messageToId,
      'messageBody': messageBody,
      'isAttachment': isAttachment,
      'inGroup': inGroup,
      'orgId': orgId,
      'name': name,
      'username': username,
      'createDate': createDate.toIso8601String(),
      'firstName': firstName,
      'lastName': lastName,
      'groupName': groupName,
      'groupRemark': groupRemark,
      'senderId': senderId,
      'groupDesc': groupDesc,
      'groupCategoryName': groupCategoryName,
      'attachment': attachment?.map((a) => a.toJson()).toList(),
      'highlight': highlight,
      'isForwarded': isForwarded,
    };
  }

}

class Attachment {
  int contentId;
  String contentName;
  int contentType;
  bool hasThumbnail;
  String relRef;
  bool isForwarded;
  dynamic highlight;

  Attachment({
    required this.contentId,
    required this.contentName,
    required this.contentType,
    required this.hasThumbnail,
    required this.relRef,
    required this.isForwarded,
    required this.highlight,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      contentId: json['contentId'],
      contentName: json['contentName'],
      contentType: json['contentType'],
      hasThumbnail: json['hasThumbnail'],
      relRef: json['relRef'],
      isForwarded: json['isForwarded'],
      highlight: json['highlight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentId': contentId,
      'contentName': contentName,
      'contentType': contentType,
      'hasThumbnail': hasThumbnail,
      'relRef': relRef,
      'isForwarded': isForwarded,
      'highlight': highlight,
    };
  }

}

class Content {
  List<dynamic> results;
  Metadata metadata;

  Content({
    required this.results,
    required this.metadata,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      results: json['results'],
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata.toJson(),
    };
  }

}

class Metadata {
  ContentGroupMap contentGroupMap;
  ContentGroupMap refUuidDict;
  int total;

  Metadata({
    required this.contentGroupMap,
    required this.refUuidDict,
    required this.total,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      contentGroupMap: ContentGroupMap(),
      refUuidDict: ContentGroupMap(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentGroupMap': contentGroupMap.toJson(),
      'refUuidDict': refUuidDict.toJson(),
      'total': total,
    };
  }

}

class ContentGroupMap {
  ContentGroupMap();
  factory ContentGroupMap.fromJson(Map<String, dynamic> json) {
    return ContentGroupMap();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class User {
  String lastMessageActivity;
  String firstName;
  String lastName;
  int userId;
  String username;
  Highlight highlight;

  User({
    required this.lastMessageActivity,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.username,
    required this.highlight,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      lastMessageActivity: json['lastMessageActivity'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
      username: json['username'],
      highlight: Highlight.fromJson(json['highlight']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastMessageActivity': lastMessageActivity,
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'username': username,
      'highlight': highlight.toJson(),
    };
  }

}

class Highlight {
  List<List<int>> firstNameMatchSpan;
  List<dynamic> lastNameMatchSpan;
  List<String> firstName;

  Highlight({
    required this.firstNameMatchSpan,
    required this.lastNameMatchSpan,
    required this.firstName,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      firstNameMatchSpan: (json['firstNameMatchSpan'] as List<dynamic>)
          .map((span) => List<int>.from(span))
          .toList(),
      lastNameMatchSpan: json['lastNameMatchSpan'],
      firstName: (json['firstName'] as List<dynamic>).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstNameMatchSpan': firstNameMatchSpan,
      'lastNameMatchSpan': lastNameMatchSpan,
      'firstName': firstName,
    };
  }

}









































// http: //192.168.1.142:8080/tf/micro/api/service/dev/v1/search/global/
// POST
//
// Authorization:Token 1938157e
//
// a06eae6a70567e31a10c2fbb287bca5b
//
// Content
// -
// Type:application/
//
// json
//
//
// Payload
// {
// keywords: ["
// gavar"]
// ,
// tags: [ ]
// , types: [ ] ,
// from: [ ] ,
// to: [] ,
// in: [] ,
// search_in_chats: false ,
// …
// }
//
// from: [
// ]
// in
// :
// [
// ]
// is_personal: false
// keywords: ["gavar"]
// 0: "gavar"
// org_id: null
// search_in_chats: false
// tags: [
// ]
// to: [
// ]
// types: [
// ]
// view_more: {content: false, groups: false, people: false, organisations: false, chats: false,…}
// chats: false
// content: false
// content_pagination: {next_files_from: 0, next_files_till: 20, next_folders_from: 0, next_folders_till: 20,…}
// file_sort_key: null
// file_sort_order: null
// folder_sort_key: null
// folder_sort_order: null
// next_files_from: 0
// next_files_only: false
// next_files_till: 20
// next_folders_from: 0
// next_folders_only: false
// next_folders_till: 20
// groups: false
// non_content_page_data: {range_from: 0, range_to: 20, sort_key: null, sort_order: null}
// organisations: false
// people: false
//
//
// response
// {
// "users": [
// {
// "last_message_activity": "2024-02-01T06:40:53.275886Z",
// "first_name": "jahangir",
// "last_name": "gavar",
// "user_id": 610,
// "username": "unruffleddewdney",
// "highlight": {
// "first_name_match_span": [],
// "last_name_match_span": [
// [
// 0,
// 5
// ]
// ],
// "last_name": [
// "<mark>gavar</mark>"
// ]
// }
// }
// ],
// "groups": [],
// "chats": [
// {
// "message_id": 1015281,
// "message_from_id": 553,
// "message_to_id": 634,
// "message_body": "@wizardlybell abe tu pigal jayega vahaaa ush k kat ne se pehle tu chala jayega",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:15:38.312931+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 553,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015281,
// "message_from_id": 553,
// "message_to_id": 634,
// "message_body": "@wizardlybell abe tu pigal jayega vahaaa ush k kat ne se pehle tu chala jayega",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:15:38.312931+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 553,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015265,
// "message_from_id": 552,
// "message_to_id": 552,
// "message_body": "oh hii ringan",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2023-11-04T04:50:12.295499+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015265,
// "message_from_id": 552,
// "message_to_id": 552,
// "message_body": "oh hii ringan",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2023-11-04T04:50:12.295499+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015272,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "kab katne vala hai tu",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:53.206203+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015272,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "kab katne vala hai tu",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:53.206203+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015267,
// "message_from_id": 552,
// "message_to_id": 553,
// "message_body": "ohh hi Ringan",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T04:55:36.010179+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015267,
// "message_from_id": 552,
// "message_to_id": 553,
// "message_body": "ohh hi Ringan",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T04:55:36.010179+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015291,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "@lovingswanson  kidhar ho seth ji\ndavat pe nahi aye bohot time se,dawat pe aye jamana ho gya \nab yad ati hai apki aoo jaldi",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:19:52.795747+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015291,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "@lovingswanson  kidhar ho seth ji\ndavat pe nahi aye bohot time se,dawat pe aye jamana ho gya \nab yad ati hai apki aoo jaldi",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:19:52.795747+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015270,
// "message_from_id": 553,
// "message_to_id": 634,
// "message_body": "hi mese sath pakne vali sabjiya",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:11.914099+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 553,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015270,
// "message_from_id": 553,
// "message_to_id": 634,
// "message_body": "hi mese sath pakne vali sabjiya",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:11.914099+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 553,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015271,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "ohh hi Ringan\nhow was your life is goineg!",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:41.495022+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015271,
// "message_from_id": 552,
// "message_to_id": 634,
// "message_body": "ohh hi Ringan\nhow was your life is goineg!",
// "is_attachment": false,
// "in_group": true,
// "org_id": -1,
// "name": null,
// "username": null,
// "create_date": "2023-11-04T05:06:41.495022+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": "vegetables",
// "group_remark": "None",
// "sender_id": 552,
// "group_desc": "User Group",
// "group_category_name": "USER_PRIVATE",
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015268,
// "message_from_id": 552,
// "message_to_id": 553,
// "message_body": "@lovingswanson",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T05:00:06.321638+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015268,
// "message_from_id": 552,
// "message_to_id": 553,
// "message_body": "@lovingswanson",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T05:00:06.321638+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015264,
// "message_from_id": 553,
// "message_to_id": 552,
// "message_body": "Hi Icecreame",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T04:47:33.802874+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1015264,
// "message_from_id": 553,
// "message_to_id": 552,
// "message_body": "Hi Icecreame",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-11-04T04:47:33.802874+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1016150,
// "message_from_id": 553,
// "message_to_id": 552,
// "message_body": "Hi Icecreame",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-12-05T10:05:22.958235+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1016150,
// "message_from_id": 553,
// "message_to_id": 552,
// "message_body": "Hi Icecreame",
// "is_attachment": false,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "xenodochialkilby",
// "create_date": "2023-12-05T10:05:22.958235+00:00",
// "first_name": "Ringan",
// "last_name": "Bateta",
// "group_name": null,
// "group_remark": null,
// "sender_id": 553,
// "group_desc": null,
// "group_category_name": null,
// "attachment": null,
// "highlight": null,
// "is_forwarded": false
// }
// ],
// "tags": null,
// "content": {
// "results": [],
// "metadata": {
// "content_group_map": {},
// "ref_uuid_dict": {},
// "total": 0
// }
// },
// "organisations": [],
// "total_users": 1,
// "total_groups": 0,
// "total_org": 0,
// "total_contents": 0,
// "total_chats": 32,
// "org_id": null,
// "resultant_total_count": null
// }


/// for a keyWord-------------------------------------------

// {
// "users": [
// {
// "last_message_activity": "-",
// "first_name": "fasdasas",
// "last_name": "dasda",
// "user_id": 21,
// "username": "testuser",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 4,
// 5
// ],
// [
// 6,
// 7
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 4,
// 5
// ]
// ],
// "first_name": [
// "f<mark>a</mark>sd<mark>a</mark>s<mark>a</mark>s"
// ],
// "last_name": [
// "d<mark>a</mark>sd<mark>a</mark>"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Jaimini",
// "last_name": "Chauhan",
// "user_id": 161,
// "username": "naughtymestorf",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "last_name_match_span": [
// [
// 2,
// 3
// ],
// [
// 5,
// 6
// ]
// ],
// "first_name": [
// "J<mark>a</mark>imini"
// ],
// "last_name": [
// "Ch<mark>a</mark>uh<mark>a</mark>n"
// ],
// "username": [
// "n<mark>a</mark>ughtymestorf"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "krupali",
// "last_name": "kanzariya",
// "user_id": 163,
// "username": "relaxedsinoussi",
// "highlight": {
// "first_name_match_span": [
// [
// 4,
// 5
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 4,
// 5
// ],
// [
// 8,
// 9
// ]
// ],
// "first_name": [
// "krup<mark>a</mark>li"
// ],
// "last_name": [
// "k<mark>a</mark>nz<mark>a</mark>riy<mark>a</mark>"
// ],
// "username": [
// "rel<mark>a</mark>xedsinoussi"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Tiwari",
// "last_name": "Shubhgyan",
// "user_id": 181,
// "username": "tendersolomon",
// "highlight": {
// "first_name_match_span": [
// [
// 3,
// 4
// ]
// ],
// "last_name_match_span": [
// [
// 7,
// 8
// ]
// ],
// "first_name": [
// "Tiw<mark>a</mark>ri"
// ],
// "last_name": [
// "Shubhgy<mark>a</mark>n"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Barclay",
// "last_name": "Valenzuela",
// "user_id": 192,
// "username": "gallantmorse",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 5,
// 6
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 9,
// 10
// ]
// ],
// "first_name": [
// "B<mark>a</mark>rcl<mark>a</mark>y"
// ],
// "last_name": [
// "V<mark>a</mark>lenzuel<mark>a</mark>"
// ],
// "username": [
// "g<mark>a</mark>ll<mark>a</mark>ntmorse"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Danielle",
// "last_name": "Jackson",
// "user_id": 193,
// "username": "objectivestonebraker",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "D<mark>a</mark>nielle"
// ],
// "last_name": [
// "J<mark>a</mark>ckson"
// ],
// "username": [
// "objectivestonebr<mark>a</mark>ker"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "hardik",
// "last_name": "mewada",
// "user_id": 198,
// "username": "suspiciouseuclid",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "last_name_match_span": [
// [
// 3,
// 4
// ],
// [
// 5,
// 6
// ]
// ],
// "first_name": [
// "h<mark>a</mark>rdik"
// ],
// "last_name": [
// "mew<mark>a</mark>d<mark>a</mark>"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Taniya",
// "last_name": "Rai",
// "user_id": 201,
// "username": "hopefulgreider",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 5,
// 6
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "T<mark>a</mark>niy<mark>a</mark>"
// ],
// "last_name": [
// "R<mark>a</mark>i"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Akash",
// "last_name": "Kushwaha",
// "user_id": 206,
// "username": "frostyfermat",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ],
// [
// 2,
// 3
// ]
// ],
// "last_name_match_span": [
// [
// 5,
// 6
// ],
// [
// 7,
// 8
// ]
// ],
// "first_name": [
// "<mark>A</mark>k<mark>a</mark>sh"
// ],
// "last_name": [
// "Kushw<mark>a</mark>h<mark>a</mark>"
// ],
// "username": [
// "frostyferm<mark>a</mark>t"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Farhad",
// "last_name": "Rabenou",
// "user_id": 219,
// "username": "clevergoldstine",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 4,
// 5
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "F<mark>a</mark>rh<mark>a</mark>d"
// ],
// "last_name": [
// "R<mark>a</mark>benou"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "ALEXANDRE",
// "last_name": "RABENOU",
// "user_id": 220,
// "username": "affectionatekeller",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ],
// [
// 4,
// 5
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "<mark>A</mark>LEX<mark>A</mark>NDRE"
// ],
// "last_name": [
// "R<mark>A</mark>BENOU"
// ],
// "username": [
// "<mark>a</mark>ffection<mark>a</mark>tekeller"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "AMIRHOSSIEN",
// "last_name": "AHMADABADI",
// "user_id": 222,
// "username": "elatedcohen",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ]
// ],
// "last_name_match_span": [
// [
// 0,
// 1
// ],
// [
// 3,
// 4
// ],
// [
// 5,
// 6
// ],
// [
// 7,
// 8
// ]
// ],
// "first_name": [
// "<mark>A</mark>MIRHOSSIEN"
// ],
// "last_name": [
// "<mark>A</mark>HM<mark>A</mark>D<mark>A</mark>B<mark>A</mark>DI"
// ],
// "username": [
// "el<mark>a</mark>tedcohen"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Ali",
// "last_name": "keyvan",
// "user_id": 224,
// "username": "pricelessdewdney",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ]
// ],
// "last_name_match_span": [
// [
// 4,
// 5
// ]
// ],
// "first_name": [
// "<mark>A</mark>li"
// ],
// "last_name": [
// "keyv<mark>a</mark>n"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Akshay",
// "last_name": "Pawar",
// "user_id": 227,
// "username": "ferventvolhard",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ],
// [
// 4,
// 5
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 3,
// 4
// ]
// ],
// "first_name": [
// "<mark>A</mark>ksh<mark>a</mark>y"
// ],
// "last_name": [
// "P<mark>a</mark>w<mark>a</mark>r"
// ],
// "username": [
// "ferventvolh<mark>a</mark>rd"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Shivani",
// "last_name": "Patel",
// "user_id": 229,
// "username": "charminglumiere",
// "highlight": {
// "first_name_match_span": [
// [
// 4,
// 5
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "Shiv<mark>a</mark>ni"
// ],
// "last_name": [
// "P<mark>a</mark>tel"
// ],
// "username": [
// "ch<mark>a</mark>rminglumiere"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Sarada",
// "last_name": "Prasan",
// "user_id": 231,
// "username": "niftyblack",
// "highlight": {
// "first_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 3,
// 4
// ],
// [
// 5,
// 6
// ]
// ],
// "last_name_match_span": [
// [
// 2,
// 3
// ],
// [
// 4,
// 5
// ]
// ],
// "first_name": [
// "S<mark>a</mark>r<mark>a</mark>d<mark>a</mark>"
// ],
// "last_name": [
// "Pr<mark>a</mark>s<mark>a</mark>n"
// ],
// "username": [
// "niftybl<mark>a</mark>ck"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Buddhadeb",
// "last_name": "Maiti",
// "user_id": 234,
// "username": "vigilantgould",
// "highlight": {
// "first_name_match_span": [
// [
// 5,
// 6
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "Buddh<mark>a</mark>deb"
// ],
// "last_name": [
// "M<mark>a</mark>iti"
// ],
// "username": [
// "vigil<mark>a</mark>ntgould"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Jyatish",
// "last_name": "Kumar",
// "user_id": 239,
// "username": "jollykhayyam",
// "highlight": {
// "first_name_match_span": [
// [
// 2,
// 3
// ]
// ],
// "last_name_match_span": [
// [
// 3,
// 4
// ]
// ],
// "first_name": [
// "Jy<mark>a</mark>tish"
// ],
// "last_name": [
// "Kum<mark>a</mark>r"
// ],
// "username": [
// "jollykh<mark>a</mark>yy<mark>a</mark>m"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "Shuvalaxmi",
// "last_name": "Das",
// "user_id": 242,
// "username": "infalliblechaum",
// "highlight": {
// "first_name_match_span": [
// [
// 4,
// 5
// ],
// [
// 6,
// 7
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "Shuv<mark>a</mark>l<mark>a</mark>xmi"
// ],
// "last_name": [
// "D<mark>a</mark>s"
// ],
// "username": [
// "inf<mark>a</mark>lliblech<mark>a</mark>um"
// ]
// }
// },
// {
// "last_message_activity": "-",
// "first_name": "amar",
// "last_name": "darji",
// "user_id": 247,
// "username": "dreamyishizaka",
// "highlight": {
// "first_name_match_span": [
// [
// 0,
// 1
// ],
// [
// 2,
// 3
// ]
// ],
// "last_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "first_name": [
// "<mark>a</mark>m<mark>a</mark>r"
// ],
// "last_name": [
// "d<mark>a</mark>rji"
// ],
// "username": [
// "dre<mark>a</mark>myishiz<mark>a</mark>k<mark>a</mark>"
// ]
// }
// }
// ],
// "groups": [],
// "chats": [
// {
// "message_id": 1019864,
// "message_from_id": 610,
// "message_to_id": 552,
// "message_body": "-",
// "is_attachment": true,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2024-01-29T10:24:15.044251+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": [
// {
// "content_id": 37452,
// "content_name": "tagi-Audio",
// "content_type": 1,
// "has_thumbnail": false,
// "rel_ref": "42f06d98-d746-4354-84dc-eb6a4a62bb18",
// "is_forwarded": false,
// "highlight": {
// "match_span": [
// [
// 1,
// 2
// ],
// [
// 5,
// 6
// ]
// ],
// "content_name": [
// "tagi-Audio"
// ]
// }
// }
// ],
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1020142,
// "message_from_id": 552,
// "message_to_id": 610,
// "message_body": "-",
// "is_attachment": true,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2024-02-01T06:44:07.225635+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": [
// {
// "content_id": 37309,
// "content_name": "images",
// "content_type": 1,
// "has_thumbnail": false,
// "rel_ref": "8d14581a-3682-4972-bdb8-d2679526cf3c",
// "is_forwarded": false,
// "highlight": {
// "match_span": [
// [
// 2,
// 3
// ]
// ],
// "content_name": [
// "images"
// ]
// }
// }
// ],
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1019169,
// "message_from_id": 610,
// "message_to_id": 552,
// "message_body": "-",
// "is_attachment": true,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2024-01-19T08:27:31.886897+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": [
// {
// "content_id": 195723,
// "content_name": "lake.jpg",
// "content_type": 2,
// "has_thumbnail": false,
// "rel_ref": "5885836b-164a-4cb2-abc6-6d9665fb7a7b",
// "is_forwarded": false,
// "highlight": {
// "match_span": [
// [
// 1,
// 2
// ]
// ],
// "content_name": [
// "lake.jpg"
// ]
// }
// }
// ],
// "highlight": null,
// "is_forwarded": false
// },
// {
// "message_id": 1020140,
// "message_from_id": 610,
// "message_to_id": 552,
// "message_body": "-",
// "is_attachment": true,
// "in_group": false,
// "org_id": -1,
// "name": null,
// "username": "My_brownsugar",
// "create_date": "2024-02-01T06:40:53.275886+00:00",
// "first_name": "Ice",
// "last_name": "creame",
// "group_name": null,
// "group_remark": null,
// "sender_id": 552,
// "group_desc": null,
// "group_category_name": null,
// "attachment": [
// {
// "content_id": 196066,
// "content_name": "RAM.jpg",
// "content_type": 2,
// "has_thumbnail": false,
// "rel_ref": "afd7046e-cb61-4654-9562-514ac360c666",
// "is_forwarded": false,
// "highlight": {
// "match_span": [
// [
// 1,
// 2
// ]
// ],
// "content_name": [
// "RAM.jpg"
// ]
// }
// }
// ],
// "highlight": null,
// "is_forwarded": false
// }
// ],
// "tags": null,
// "content": {
// "results": [
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "krishna.jpg",
// "content_size": 70008,
// "content_id": 195442,
// "content_thumbnails": [],
// "content_parent_id": 37309,
// "content_path": "",
// "user_id": 552,
// "create_date": "2024-01-12T06:14:56.105415+00:00",
// "update_date": "2024-01-12T06:14:58.801737+00:00",
// "user_name": "Ice creame",
// "username": "My_brownsugar",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": false,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "krishn<mark>a</mark>.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 6,
// 7
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "Ice",
// "last_name": "creame",
// "username": "My_brownsugar",
// "id": 552
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": false,
// "directory": true,
// "is_directory": true,
// "content_name": "images",
// "content_size": 0,
// "content_id": 37309,
// "content_thumbnails": [],
// "content_parent_id": 36206,
// "content_path": "",
// "user_id": 552,
// "create_date": "2024-01-12T06:14:55.899316+00:00",
// "update_date": "2024-01-12T06:14:55.901052+00:00",
// "user_name": "Ice creame",
// "username": "My_brownsugar",
// "in_group": false,
// "group_id": null,
// "is_file": false,
// "owned": false,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "im<mark>a</mark>ges"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 2,
// 3
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "Ice",
// "last_name": "creame",
// "username": "My_brownsugar",
// "id": 552
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919054771708_status_febebe3db68545bdbcb633d50d95fb47.jpg",
// "content_size": 20761,
// "content_id": 196054,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:03.301620+00:00",
// "update_date": "2024-02-01T06:08:06.118666+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919054771708_st<mark>a</mark>tus_febebe3db68545bdbcb633d50d95fb47.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919638866098_status_5a2cb4372db94f8eac72de11877f7293.mp4",
// "content_size": 2604530,
// "content_id": 196057,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:15.942049+00:00",
// "update_date": "2024-02-01T06:08:18.744210+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919638866098_st<mark>a</mark>tus_5<mark>a</mark>2cb4372db94f8e<mark>a</mark>c72de11877f7293.mp4"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 21,
// 22
// ],
// [
// 36,
// 37
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919638866098_status_5cbd6607a70449f094994828a2d4bc74.mp4",
// "content_size": 3819569,
// "content_id": 196058,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:22.118016+00:00",
// "update_date": "2024-02-01T06:08:25.058389+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919638866098_st<mark>a</mark>tus_5cbd6607<mark>a</mark>70449f094994828<mark>a</mark>2d4bc74.mp4"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 28,
// 29
// ],
// [
// 44,
// 45
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "Portgas D Ace.jpg",
// "content_size": 129516,
// "content_id": 196065,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:59.418760+00:00",
// "update_date": "2024-02-01T06:09:02.304308+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "Portg<mark>a</mark>s D <mark>A</mark>ce.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 5,
// 6
// ],
// [
// 10,
// 11
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": false,
// "directory": true,
// "is_directory": true,
// "content_name": "vishal",
// "content_size": 0,
// "content_id": 37629,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-07T09:59:01.536760+00:00",
// "update_date": "2024-02-07T09:59:01.919914+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": false,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "vish<mark>a</mark>l"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 4,
// 5
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "917984708703_status_e59f139a2765463db41ec59a84d3d66d.jpg",
// "content_size": 75761,
// "content_id": 196053,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:00.204591+00:00",
// "update_date": "2024-02-01T06:08:02.881083+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "917984708703_st<mark>a</mark>tus_e59f139<mark>a</mark>2765463db41ec59<mark>a</mark>84d3d66d.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 27,
// 28
// ],
// [
// 43,
// 44
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919304581199_status_b9bdf6d5bac34aca8c3c5775b4cc8e7d.jpg",
// "content_size": 125105,
// "content_id": 196055,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:06.555361+00:00",
// "update_date": "2024-02-01T06:08:09.505498+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919304581199_st<mark>a</mark>tus_b9bdf6d5b<mark>a</mark>c34<mark>a</mark>c<mark>a</mark>8c3c5775b4cc8e7d.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 29,
// 30
// ],
// [
// 33,
// 34
// ],
// [
// 35,
// 36
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "Shikhar pandey.jpg",
// "content_size": 70372,
// "content_id": 196067,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:09:06.383534+00:00",
// "update_date": "2024-02-01T06:09:09.933583+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "Shikh<mark>a</mark>r p<mark>a</mark>ndey.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 5,
// 6
// ],
// [
// 9,
// 10
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919601947636_status_55f82a51bbdd437695dd3ee59f8c84a3.jpg",
// "content_size": 52031,
// "content_id": 196056,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:10.247321+00:00",
// "update_date": "2024-02-01T06:08:13.330781+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919601947636_st<mark>a</mark>tus_55f82<mark>a</mark>51bbdd437695dd3ee59f8c84<mark>a</mark>3.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 25,
// 26
// ],
// [
// 50,
// 51
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919638866098_status_ff139ab7d7644ba7bf2dd1cfb91ba9e6.mp4",
// "content_size": 3474578,
// "content_id": 196059,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:28.093402+00:00",
// "update_date": "2024-02-01T06:08:31.111454+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919638866098_st<mark>a</mark>tus_ff139<mark>a</mark>b7d7644b<mark>a</mark>7bf2dd1cfb91b<mark>a</mark>9e6.mp4"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 25,
// 26
// ],
// [
// 34,
// 35
// ],
// [
// 48,
// 49
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "Eye Ball.jpg",
// "content_size": 169273,
// "content_id": 196062,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:45.711084+00:00",
// "update_date": "2024-02-01T06:08:48.508195+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "Eye B<mark>a</mark>ll.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 5,
// 6
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": false,
// "directory": true,
// "is_directory": true,
// "content_name": "Tagifiles",
// "content_size": 0,
// "content_id": 37439,
// "content_thumbnails": [],
// "content_parent_id": 0,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-01-19T07:53:19.587023+00:00",
// "update_date": "2024-01-19T07:53:19.873359+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": false,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "T<mark>a</mark>gifiles"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "919963215574_status_f0a6e1c975d341d2b1ee21b4ba188925.jpg",
// "content_size": 89836,
// "content_id": 196060,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:31.616603+00:00",
// "update_date": "2024-02-01T06:08:34.499128+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "919963215574_st<mark>a</mark>tus_f0<mark>a</mark>6e1c975d341d2b1ee21b4b<mark>a</mark>188925.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 15,
// 16
// ],
// [
// 22,
// 23
// ],
// [
// 45,
// 46
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "MASTER WALLPAPER.jpg",
// "content_size": 251176,
// "content_id": 196064,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:08:55.600773+00:00",
// "update_date": "2024-02-01T06:08:58.840271+00:00",
// "user_name": " ",
// "username": "",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "M<mark>A</mark>STER W<mark>A</mark>LLP<mark>A</mark>PER.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 1,
// 2
// ],
// [
// 8,
// 9
// ],
// [
// 12,
// 13
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "",
// "last_name": "",
// "username": "",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// },
// {
// "file": true,
// "directory": false,
// "is_directory": false,
// "content_name": "RAM.jpg",
// "content_size": 123015,
// "content_id": 196066,
// "content_thumbnails": [],
// "content_parent_id": 37439,
// "content_path": "",
// "user_id": 610,
// "create_date": "2024-02-01T06:09:02.810333+00:00",
// "update_date": "2024-02-01T06:09:05.518765+00:00",
// "user_name": "jahangir gavar",
// "username": "unruffleddewdney",
// "in_group": false,
// "group_id": null,
// "is_file": true,
// "owned": true,
// "shared_updated_by_id": null,
// "shared_updated_by_name": null,
// "shared_created_by_id": null,
// "shared_created_by_name": null,
// "version_count": 0,
// "tags": [],
// "highlight": {
// "content_name": [
// "R<mark>A</mark>M.jpg"
// ],
// "content_ext": [],
// "content_name_match_span": [
// [
// 1,
// 2
// ]
// ],
// "content_ext_match_span": []
// },
// "metadata": {
// "user": {
// "first_name": "jahangir",
// "last_name": "gavar",
// "username": "unruffleddewdney",
// "id": 610
// },
// "group": {
// "group_name": "",
// "id": null
// }
// }
// }
// ],
// "metadata": {
// "content_group_map": {},
// "ref_uuid_dict": {
// "195442": "8d14581a-3682-4972-bdb8-d2679526cf3c",
// "D37309": "8d14581a-3682-4972-bdb8-d2679526cf3c"
// },
// "total": 17
// }
// },
// "organisations": [],
// "total_users": 524,
// "total_groups": 0,
// "total_org": 0,
// "total_contents": 17,
// "total_chats": 4,
// "org_id": null,
// "resultant_total_count": null
// }