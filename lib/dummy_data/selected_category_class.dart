class SelectedCategory {
  final String? userId;
  final String? categoryId;

  SelectedCategory({
    this.userId,
    this.categoryId,
  });

  Map toJson() => {
        'userId': userId,
        'categoryId': categoryId,
      };

  SelectedCategory.fromJson(Map json)
      : userId = json['userId'],
        categoryId = json['categoryId'];
}
