class Spot {
  final String? id;
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? url;
  final String? image;
  final DateTime? createdDate;
  final String? categoryId;
  final String? description;

  Spot({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.url,
    this.image,
    this.createdDate,
    this.categoryId,
    this.description,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'url': url,
        'image': image,
        'createdDate': createdDate.toString(),
        'categoryId': categoryId,
        'description': description,
      };

  Spot.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        url = json['url'],
        image = json['image'],
        createdDate = DateTime.parse(json['createdDate']),
        categoryId = json['categoryId'],
        description = json['description'];
}
