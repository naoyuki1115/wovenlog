class Like {
  String? userId;
  String? spotId;
  DateTime? createdDate;

  Like({
    this.userId,
    this.spotId,
    this.createdDate,
  });

  Map toJson() => {
    'userId': userId,
    'spotId': spotId,
    'createdDate': createdDate.toString(),
  };

  Like.fromJson(Map json)
    : userId = json['userId'],
      spotId = json['spotId'],
      createdDate = DateTime.parse(json['createdDate']);
}
