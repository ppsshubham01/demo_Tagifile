

class PathModel {
  final int? parentId;
  final String? sortOrder;
  final String? sortBy;
  final String? filterBy;
  final String contentPath;
  final bool onlyDirs;
  final PageRange? pageRange;
  final dynamic? orgId;

  PathModel({
     this.parentId,
     this.sortOrder,
     this.sortBy,
     this.filterBy,
    required this.contentPath,
    required this.onlyDirs,
     this.pageRange,
     this.orgId,
  });


}

class PageRange {
  int? pgFrom;
  int? pgTo;

  PageRange({
     this.pgFrom,
     this.pgTo,
  });

}
