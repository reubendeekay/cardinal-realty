enum PropertyTypes { PRIVATE, AGENCY }

class PropertyModel {
  final String id;
  final String ownerId;
  final String name;
  final String description;
  final String address;
  final String price;
  final String coverImage;
  List<dynamic> images;
  final PropertyTypes propertyTypes;
  final bool liked;

  PropertyModel({
    this.id,
    this.ownerId,
    this.name,
    this.description,
    this.address,
    this.price,
    this.coverImage,
    this.images,
    this.liked,
    this.propertyTypes,
  });
}
