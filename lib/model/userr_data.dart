

class JsonResponse {
  final List<Content> result;
  final String path;
  final int currentParent;
  final Map<String, dynamic> sharingData;
  final List<dynamic> sharedWith;
  final Map<String, dynamic> pageData;

  JsonResponse({
    required this.result,
    required this.path,
    required this.currentParent,
    required this.sharingData,
    required this.sharedWith,
    required this.pageData,
  });

}

  class Content {
    final int parentId;
    final int userId;
    final String createDate;
    final String updateDate;
    final String contentName;
    final int contentId;
    final int contentParentId;
    final int contentSize;
    final bool isFile;
    final bool isDirectory;

    Content({
      required this.parentId,
      required this.userId,
      required this.createDate,
      required this.updateDate,
      required this.contentName,
      required this.contentId,
      required this.contentParentId,
      required this.contentSize,
      required this.isFile,
      required this.isDirectory,
    });

  }
  //final List<Content> resul