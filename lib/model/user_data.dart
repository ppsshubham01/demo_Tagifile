// To parse this JSON data, do
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  final List<Result>? result;
  final String? path;
  final int? currentParent;
  final Map<String, SharingDatum>? sharingData;
  final List<dynamic>? sharedWith;
  final PageData? pageData;

  Model({
    this.result,
    this.path,
    this.currentParent,
    this.sharingData,
    this.sharedWith,
    this.pageData,
  });

  Model copyWith({
    List<Result>? result,
    String? path,
    int? currentParent,
    Map<String, SharingDatum>? sharingData,
    List<dynamic>? sharedWith,
    PageData? pageData,
  }) =>
      Model(
        result: result ?? this.result,
        path: path ?? this.path,
        currentParent: currentParent ?? this.currentParent,
        sharingData: sharingData ?? this.sharingData,
        sharedWith: sharedWith ?? this.sharedWith,
        pageData: pageData ?? this.pageData,
      );

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    path: json["path"],
    currentParent: json["current_parent"],
    sharingData: Map.from(json["sharing_data"]!).map((k, v) => MapEntry<String, SharingDatum>(k, SharingDatum.fromJson(v))),
    sharedWith: json["shared_with"] == null ? [] : List<dynamic>.from(json["shared_with"]!.map((x) => x)),
    pageData: json["page_data"] == null ? null : PageData.fromJson(json["page_data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "path": path,
    "current_parent": currentParent,
    "sharing_data": Map.from(sharingData!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "shared_with": sharedWith == null ? [] : List<dynamic>.from(sharedWith!.map((x) => x)),
    "page_data": pageData?.toJson(),
  };
}

class PageData {
  final int? countOfFiles;
  final int? countOfFolders;

  PageData({
    this.countOfFiles,
    this.countOfFolders,
  });

  PageData copyWith({
    int? countOfFiles,
    int? countOfFolders,
  }) =>
      PageData(
        countOfFiles: countOfFiles ?? this.countOfFiles,
        countOfFolders: countOfFolders ?? this.countOfFolders,
      );

  /// Map/Json to Object
  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
    countOfFiles: json["count_of_files"],
    countOfFolders: json["count_of_folders"],
  );

  /// Object to Map/Json
  Map<String, dynamic> toJson() => {
    "count_of_files": countOfFiles,
    "count_of_folders": countOfFolders,
  };
}

class Result {
  final int? parentId;
  final int? userId;
  final dynamic sharedCreatedById;
  final dynamic sharedUpdatedById;
  final DateTime? createDate;
  final DateTime? updateDate;
  final String? contentName;
  final int? contentId;
  final int? contentParentId;
  final int? contentSize;
  final DateTime? systemLastModified;
  final bool? isFile;
  final int? blocksCount;
  final bool? isDirectory;
  final String? sharedCreatedByName;
  final String? sharedUpdatedByName;
  final int? versionCount;

  Result({
    this.parentId,
    this.userId,
    this.sharedCreatedById,
    this.sharedUpdatedById,
    this.createDate,
    this.updateDate,
    this.contentName,
    this.contentId,
    this.contentParentId,
    this.contentSize,
    this.systemLastModified,
    this.isFile,
    this.blocksCount,
    this.isDirectory,
    this.sharedCreatedByName,
    this.sharedUpdatedByName,
    this.versionCount,
  });

  Result copyWith({
    int? parentId,
    int? userId,
    dynamic sharedCreatedById,
    dynamic sharedUpdatedById,
    DateTime? createDate,
    DateTime? updateDate,
    String? contentName,
    int? contentId,
    int? contentParentId,
    int? contentSize,
    DateTime? systemLastModified,
    bool? isFile,
    int? blocksCount,
    bool? isDirectory,
    String? sharedCreatedByName,
    String? sharedUpdatedByName,
    int? versionCount,
  }) =>
      Result(
        parentId: parentId ?? this.parentId,
        userId: userId ?? this.userId,
        sharedCreatedById: sharedCreatedById ?? this.sharedCreatedById,
        sharedUpdatedById: sharedUpdatedById ?? this.sharedUpdatedById,
        createDate: createDate ?? this.createDate,
        updateDate: updateDate ?? this.updateDate,
        contentName: contentName ?? this.contentName,
        contentId: contentId ?? this.contentId,
        contentParentId: contentParentId ?? this.contentParentId,
        contentSize: contentSize ?? this.contentSize,
        systemLastModified: systemLastModified ?? this.systemLastModified,
        isFile: isFile ?? this.isFile,
        blocksCount: blocksCount ?? this.blocksCount,
        isDirectory: isDirectory ?? this.isDirectory,
        sharedCreatedByName: sharedCreatedByName ?? this.sharedCreatedByName,
        sharedUpdatedByName: sharedUpdatedByName ?? this.sharedUpdatedByName,
        versionCount: versionCount ?? this.versionCount,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    parentId: json["parent_id"],
    userId: json["user_id"],
    sharedCreatedById: json["shared_created_by_id"],
    sharedUpdatedById: json["shared_updated_by_id"],
    createDate: json["create_date"] == null ? null : DateTime.parse(json["create_date"]),
    updateDate: json["update_date"] == null ? null : DateTime.parse(json["update_date"]),
    contentName: json["content_name"],
    contentId: json["content_id"],
    contentParentId: json["content_parent_id"],
    contentSize: json["content_size"],
    systemLastModified: json["system_last_modified"] == null ? null : DateTime.parse(json["system_last_modified"]),
    isFile: json["is_file"],
    blocksCount: json["blocks_count"],
    isDirectory: json["is_directory"],
    sharedCreatedByName: json["shared_created_by_name"],
    sharedUpdatedByName: json["shared_updated_by_name"],
    versionCount: json["version_count"],
  );

  Map<String, dynamic> toJson() => {
    "parent_id": parentId,
    "user_id": userId,
    "shared_created_by_id": sharedCreatedById,
    "shared_updated_by_id": sharedUpdatedById,
    "create_date": createDate?.toIso8601String(),
    "update_date": updateDate?.toIso8601String(),
    "content_name": contentName,
    "content_id": contentId,
    "content_parent_id": contentParentId,
    "content_size": contentSize,
    "system_last_modified": systemLastModified?.toIso8601String(),
    "is_file": isFile,
    "blocks_count": blocksCount,
    "is_directory": isDirectory,
    "shared_created_by_name": sharedCreatedByName,
    "shared_updated_by_name": sharedUpdatedByName,
    "version_count": versionCount,
  };
}

class SharingDatum {
  final bool? groups;
  final bool? users;

  SharingDatum({
    this.groups,
    this.users,
  });

  SharingDatum copyWith({
    bool? groups,
    bool? users,
  }) =>
      SharingDatum(
        groups: groups ?? this.groups,
        users: users ?? this.users,
      );

  factory SharingDatum.fromJson(Map<String, dynamic> json) => SharingDatum(
    groups: json["groups"],
    users: json["users"],
  );

  Map<String, dynamic> toJson() => {
    "groups": groups,
    "users": users,
  };
}