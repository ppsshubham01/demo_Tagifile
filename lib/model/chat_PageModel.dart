class ChatPageData {
  List<Datum>? data;
  Other? other;

  ChatPageData({
    this.data,
    this.other,
  });

  factory ChatPageData.fromJson(Map<String, dynamic> json) => ChatPageData(
        data: json['data'] != null
            ? List<Datum>.from(json['data'].map((x) => Datum.fromJson(x)))
            : null,
        other: json['other'] != null ? Other.fromJson(json['other']) : null,
      );

  Map<String, dynamic> toJson() => {
        'data': data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
        'other': other != null ? other!.toJson() : null,
      };
}

class Datum {
  int datumId;
  bool? isRead;
  int messageFromId;
  int messageToId;
  bool inGroup;
  int id;
  Name name;
  bool starred;
  List<Mention> mentions;
  String messageBody;
  DateTime createDate;
  bool isForwarded;
  bool edited;
  dynamic parentMsgDetail;
  bool isMeetingMissedCall;
  bool isMeetingRec;
  bool outgoingCall;
  bool incomingCall;
  dynamic meetingStartTime;
  dynamic meetingEndTime;
  List<Attachement> attachements;
  bool isReplyTo;
  dynamic replyToId;
  bool isPrivateReply;
  dynamic replySourceGroup;
  dynamic replyAttachementId;

  Datum({
    required this.datumId,
    required this.isRead,
    required this.messageFromId,
    required this.messageToId,
    required this.inGroup,
    required this.id,
    required this.name,
    required this.starred,
    required this.mentions,
    required this.messageBody,
    required this.createDate,
    required this.isForwarded,
    required this.edited,
    required this.parentMsgDetail,
    required this.isMeetingMissedCall,
    required this.isMeetingRec,
    required this.outgoingCall,
    required this.incomingCall,
    required this.meetingStartTime,
    required this.meetingEndTime,
    required this.attachements,
    required this.isReplyTo,
    required this.replyToId,
    required this.isPrivateReply,
    required this.replySourceGroup,
    required this.replyAttachementId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        datumId: json['id'],
        isRead: json['is_read'],
        messageFromId: json['message_from_id'],
        messageToId: json['message_to_id'],
        inGroup: json['in_group'],
        id: json['_id'],
        name: (json['name'] as String).toUpperCase() == 'ICE_CREAME'
            ? Name.ICE_CREAME
            : Name.RINGAN_BATETA,
        starred: json['starred'],
        mentions: List<Mention>.from(
            json['mentions'].map((x) => Mention.fromJson(x))),
        messageBody: json['message_body'],
        createDate: DateTime.parse(json['create_date']),
        isForwarded: json['is_forwarded'],
        edited: json['edited'],
        parentMsgDetail: json['parent_msg_detail'],
        isMeetingMissedCall: json['is_meeting_missed_call'],
        isMeetingRec: json['is_meeting_rec'],
        outgoingCall: json['outgoing_call'],
        incomingCall: json['incoming_call'],
        meetingStartTime: json['meeting_start_time'],
        meetingEndTime: json['meeting_end_time'],
        attachements: List<Attachement>.from(
            json['attachements'].map((x) => Attachement.fromJson(x))),
        isReplyTo: json['is_reply_to'],
        replyToId: json['reply_to_id'],
        isPrivateReply: json['is_private_reply'],
        replySourceGroup: json['reply_source_group'],
        replyAttachementId: json['reply_attachement_id'],
      );

  Map<String, dynamic> toJson() => {
        'datumId': datumId,
        'isRead': isRead,
        'messageFromId': messageFromId,
        'messageToId': messageToId,
        'inGroup': inGroup,
        'id': id,
        'name': name,
        'starred': starred,
        'mentions': List<dynamic>.from(mentions.map((x) => x.toJson())),
        'messageBody': messageBody,
        'createDate': createDate.toIso8601String(),
        'isForwarded': isForwarded,
        'edited': edited,
        'parentMsgDetail': parentMsgDetail,
        'isMeetingMissedCall': isMeetingMissedCall,
        'isMeetingRec': isMeetingRec,
        'outgoingCall': outgoingCall,
        'incomingCall': incomingCall,
        'meetingStartTime': meetingStartTime,
        'meetingEndTime': meetingEndTime,
        'attachements': List<dynamic>.from(attachements.map((x) => x.toJson())),
        'isReplyTo': isReplyTo,
        'replyToId': replyToId,
        'isPrivateReply': isPrivateReply,
        'replySourceGroup': replySourceGroup,
        'replyAttachementId': replyAttachementId,
      };
}

class Attachement {
  int attachementId;
  int contentId;
  String contentName;
  int contentType;
  String relRef;
  bool isForwarded;
  int versions;

  Attachement({
    required this.attachementId,
    required this.contentId,
    required this.contentName,
    required this.contentType,
    required this.relRef,
    required this.isForwarded,
    required this.versions,
  });

  factory Attachement.fromJson(Map<String, dynamic> json) => Attachement(
        attachementId: json['attachement_id'],
        contentId: json['content_id'],
        contentName: json['content_name'],
        contentType: json['content_type'],
        relRef: json['rel_ref'],
        isForwarded: json['is_forwarded'],
        versions: json['versions'],
      );

  Map<String, dynamic> toJson() => {
        'attachement_id': attachementId,
        'content_id': contentId,
        'content_name': contentName,
        'content_type': contentType,
        'rel_ref': relRef,
        'is_forwarded': isForwarded,
        'versions': versions,
      };
}

class Mention {
  String username;
  int start;
  int end;
  String name;
  int id;

  Mention({
    required this.username,
    required this.start,
    required this.end,
    required this.name,
    required this.id,
  });

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
        username: json['username'],
        start: json['start'],
        end: json['end'],
        name: json['name'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'start': start,
        'end': end,
        'name': name,
        'id': id,
      };
}

enum Name { ICE_CREAME, RINGAN_BATETA }

class Other {
  RequestDetail requestDetail;
  int totalMessages;
  List<dynamic> unread;
  bool trusted;
  bool blocked;
  bool hideTrusted;
  dynamic pageNumber;

  Other({
    required this.requestDetail,
    required this.totalMessages,
    required this.unread,
    required this.trusted,
    required this.blocked,
    required this.hideTrusted,
    required this.pageNumber,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        requestDetail: RequestDetail.fromJson(json['request_detail']),
        totalMessages: json['total_messages'],
        unread: List<dynamic>.from(json['unread'].map((x) => x)),
        trusted: json['trusted'],
        blocked: json['blocked'],
        hideTrusted: json['hide_trusted'],
        pageNumber: json['page_number'],
      );

  Map<String, dynamic> toJson() => {
        'request_detail': requestDetail.toJson(),
        'total_messages': totalMessages,
        'unread': List<dynamic>.from(unread.map((x) => x)),
        'trusted': trusted,
        'blocked': blocked,
        'hide_trusted': hideTrusted,
        'page_number': pageNumber,
      };
}

class RequestDetail {
  int messageToId;
  bool inGroup;
  int rangeFrom;
  int rangeTo;
  String tfName;
  dynamic orgId;
  dynamic messageId;
  dynamic messageDate;
  bool starred;

  RequestDetail({
    required this.messageToId,
    required this.inGroup,
    required this.rangeFrom,
    required this.rangeTo,
    required this.tfName,
    required this.orgId,
    required this.messageId,
    required this.messageDate,
    required this.starred,
  });

  factory RequestDetail.fromJson(Map<String, dynamic> json) => RequestDetail(
        messageToId: json['message_to_id'],
        inGroup: json['in_group'],
        rangeFrom: json['range_from'],
        rangeTo: json['range_to'],
        tfName: json['tf_name'],
        orgId: json['org_id'],
        messageId: json['message_id'],
        messageDate: json['message_date'],
        starred: json['starred'],
      );

  Map<String, dynamic> toJson() => {
        'message_to_id': messageToId,
        'in_group': inGroup,
        'range_from': rangeFrom,
        'range_to': rangeTo,
        'tf_name': tfName,
        'org_id': orgId,
        'message_id': messageId,
        'message_date': messageDate,
        'starred': starred,
      };
}

// class ChatPage {
//   String message;
//   List<Datum> data;
//   Other other;
//   int status;
//
//   ChatPage({
//     required this.message,
//     required this.data,
//     required this.other,
//     required this.status,
//   });
// }
//
// class Datum {
//   int datumId;
//   bool? isRead;
//   int messageFromId;
//   int messageToId;
//   bool inGroup;
//   int id;
//   Name name;
//   bool starred;
//   List<Mention> mentions;
//   String messageBody;
//   DateTime createDate;
//   bool isForwarded;
//   bool edited;
//   dynamic parentMsgDetail;
//   bool isMeetingMissedCall;
//   bool isMeetingRec;
//   bool outgoingCall;
//   bool incomingCall;
//   dynamic meetingStartTime;
//   dynamic meetingEndTime;
//   List<Attachement> attachements;
//   bool isReplyTo;
//   dynamic replyToId;
//   bool isPrivateReply;
//   dynamic replySourceGroup;
//   dynamic replyAttachementId;
//
//   Datum({
//     required this.datumId,
//     required this.isRead,
//     required this.messageFromId,
//     required this.messageToId,
//     required this.inGroup,
//     required this.id,
//     required this.name,
//     required this.starred,
//     required this.mentions,
//     required this.messageBody,
//     required this.createDate,
//     required this.isForwarded,
//     required this.edited,
//     required this.parentMsgDetail,
//     required this.isMeetingMissedCall,
//     required this.isMeetingRec,
//     required this.outgoingCall,
//     required this.incomingCall,
//     required this.meetingStartTime,
//     required this.meetingEndTime,
//     required this.attachements,
//     required this.isReplyTo,
//     required this.replyToId,
//     required this.isPrivateReply,
//     required this.replySourceGroup,
//     required this.replyAttachementId,
//   });
// }
//
// class Attachement {
//   int attachementId;
//   int contentId;
//   String contentName;
//   int contentType;
//   String relRef;
//   bool isForwarded;
//   int versions;
//
//   Attachement({
//     required this.attachementId,
//     required this.contentId,
//     required this.contentName,
//     required this.contentType,
//     required this.relRef,
//     required this.isForwarded,
//     required this.versions,
//   });
// }
//
// class Mention {
//   String username;
//   int start;
//   int end;
//   String name;
//   int id;
//
//   Mention({
//     required this.username,
//     required this.start,
//     required this.end,
//     required this.name,
//     required this.id,
//   });
// }
//
// enum Name { ICE_CREAME, RINGAN_BATETA }
//
// class Other {
//   RequestDetail requestDetail;
//   int totalMessages;
//   List<dynamic> unread;
//   bool trusted;
//   bool blocked;
//   bool hideTrusted;
//   dynamic pageNumber;
//
//   Other({
//     required this.requestDetail,
//     required this.totalMessages,
//     required this.unread,
//     required this.trusted,
//     required this.blocked,
//     required this.hideTrusted,
//     required this.pageNumber,
//   });
// }
//
// class RequestDetail {
//   int messageToId;
//   bool inGroup;
//   int rangeFrom;
//   int rangeTo;
//   String tfName;
//   dynamic orgId;
//   dynamic messageId;
//   dynamic messageDate;
//   bool starred;
//
//   RequestDetail({
//     required this.messageToId,
//     required this.inGroup,
//     required this.rangeFrom,
//     required this.rangeTo,
//     required this.tfName,
//     required this.orgId,
//     required this.messageId,
//     required this.messageDate,
//     required this.starred,
//   });
// }
