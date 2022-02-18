import 'package:real_estate_ui/models/property.dart';

class StaticData {
  static final List<PropertyModel> sampleProperties = [
    PropertyModel(
      name: "Gorgious Appartment",
      coverImage:
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: "KES 402,800/yr",
      description: "1-4 Beds, 1-2 Baths, 1,852 sqft",
      address: "252 1st Avenue",
      propertyTypes: PropertyTypes.AGENCY,
      liked: false,
    ),
    PropertyModel(
      name: "Gorgious Apartment",
      coverImage:
          "https://images.unsplash.com/photo-1572120360610-d971b9d7767c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: "KES 200,800/yr",
      description: "1-4 Beds, 1-2 Baths, 1,852 sqft",
      address: "252 1st Avenue",
      propertyTypes: PropertyTypes.PRIVATE,
      liked: true,
    ),
    PropertyModel(
      name: "Gorgious Appartment",
      coverImage:
          "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      price: "KES 112,800/yr",
      description: "1-4 Beds, 1-2 Baths, 1,852 sqft",
      address: "252 1st Avenue",
      propertyTypes: PropertyTypes.AGENCY,
      liked: false,
    ),
    PropertyModel(
      name: "Gorgious Appartment",
      coverImage:
          "https://images.unsplash.com/photo-1449844908441-8829872d2607?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      price: "KES 92,800/yr",
      description: "1-4 Beds, 1-2 Baths, 1,852 sqft",
      address: "252 1st Avenue",
      propertyTypes: PropertyTypes.AGENCY,
      liked: true,
    ),
  ];
}
