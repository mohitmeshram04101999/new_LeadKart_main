class FacebookPage {
  final String accessToken;
  final String category;
  final List<CategoryList> categoryList;
  final String name;
  final String id;
  final List<String> tasks;

  FacebookPage({
    required this.accessToken,
    required this.category,
    required this.categoryList,
    required this.name,
    required this.id,
    required this.tasks,
  });

  Map<String, dynamic> toMap() {
    return {
      'accessToken': this.accessToken,
      'category': this.category,
      'categoryList': this.categoryList,
      'name': this.name,
      'id': this.id,
      'tasks': this.tasks,
    };
  }

  factory FacebookPage.fromMap(Map<String, dynamic> map) {
    return FacebookPage(
      accessToken: map['accessToken'] as String,
      category: map['category'] as String,
      categoryList: map['categoryList'] as List<CategoryList>,
      name: map['name'] as String,
      id: map['id'] as String,
      tasks: map['tasks'] as List<String>,
    );
  }
}

class CategoryList {
  final String id;
  final String name;

  CategoryList({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory CategoryList.fromMap(Map<String, dynamic> map) {
    return CategoryList(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}

class Paging {
  final Cursors cursors;

  Paging({
    required this.cursors,
  });

  Map<String, dynamic> toMap() {
    return {
      'cursors': this.cursors,
    };
  }

  factory Paging.fromMap(Map<String, dynamic> map) {
    return Paging(
      cursors: map['cursors'] as Cursors,
    );
  }
}

class Cursors {
  final String before;
  final String after;

  Cursors({
    required this.before,
    required this.after,
  });

  Map<String, dynamic> toMap() {
    return {
      'before': this.before,
      'after': this.after,
    };
  }

  factory Cursors.fromMap(Map<String, dynamic> map) {
    return Cursors(
      before: map['before'] as String,
      after: map['after'] as String,
    );
  }
}

class FacebookPageData {
  final List<dynamic> data;
  final Map<String, dynamic> paging;

  FacebookPageData({
    required this.data,
    required this.paging,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
      'paging': this.paging,
    };
  }

  factory FacebookPageData.fromMap(Map<String, dynamic> map) {

    // if(map==null)
    //   {
    //     return FacebookPageData(
    //       data: [],
    //       paging: {},
    //     ) ;
    //   }
    return FacebookPageData(
      data: map['data']??[],
      paging: map['paging']??{},
    );
  }
}
