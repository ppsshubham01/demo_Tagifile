

class GlobalSearch {
  List<User> users;
  List<dynamic> groups;
  List<Chat> chats;
  dynamic tags;
  Content content;
  List<dynamic> organisations;
  int totalUsers;
  int totalGroups;
  int totalOrg;
  int totalContents;
  int totalChats;
  dynamic orgId;
  dynamic resultantTotalCount;

  GlobalSearch({
    required this.users,
    required this.groups,
    required this.chats,
    required this.tags,
    required this.content,
    required this.organisations,
    required this.totalUsers,
    required this.totalGroups,
    required this.totalOrg,
    required this.totalContents,
    required this.totalChats,
    required this.orgId,
    required this.resultantTotalCount,
  });

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

}

class Content {
  List<dynamic> results;
  Metadata metadata;

  Content({
    required this.results,
    required this.metadata,
  });

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

}

class ContentGroupMap {
  ContentGroupMap();
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