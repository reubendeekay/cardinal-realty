import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_ui/models/property.dart';
import 'package:real_estate_ui/models/user_model.dart';

class PropertyProvider with ChangeNotifier {
  List<PropertyModel> _properties = [];
  List<PropertyModel> _yourHistory = [];
  List<PropertyModel> _yourWishlist = [];
  List<PropertyModel> get properties => [..._properties];
  List<PropertyModel> get yourHistory => [..._yourHistory];
  List<PropertyModel> get yourWishlist => [..._yourWishlist];

  Future<void> fetchProperties() async {
    final propertyData = await FirebaseFirestore.instance
        .collection('propertyData')
        .doc('propertyListing')
        .collection('properties')
        .get();
    List<PropertyModel> propData = [];

    propertyData.docs.forEach((e) {
      propData.add(PropertyModel(
        id: e.id,
        name: e['name'],
        coverImage: e['coverImage'],
        price: e['price'],
        images: e['images'],
        ownerId: e['ownerId'],
        propertyTypes: e['propertyType'],
        description: e['description'],
        address: e['address'],
      ));
    });

    _properties = propData;

    notifyListeners();
  }

  Future<void> addRecentSearch(String searchTerm) async {
    if (searchTerm.isNotEmpty) {
      final searchData = await FirebaseFirestore.instance
          .collection('userData')
          .doc('recentSearch')
          .collection(FirebaseAuth.instance.currentUser.uid)
          .get();
      if (searchData.docs.contains(searchTerm)) {
        await FirebaseFirestore.instance
            .collection('userData')
            .doc('recentSearch')
            .collection(FirebaseAuth.instance.currentUser.uid)
            .doc(searchData.docs
                .firstWhere((element) => element.data()['term'] == searchTerm)
                .id)
            .update({
          'createdAt': Timestamp.now(),
        });
      } else {
        await FirebaseFirestore.instance
            .collection('userData')
            .doc('recentSearch')
            .collection(FirebaseAuth.instance.currentUser.uid)
            .doc()
            .set({
          'term': searchTerm,
          'createdAt': Timestamp.now(),
        });
      }
    }
    notifyListeners();
  }

  Future<void> addView(
    String id,
  ) async {
    await FirebaseFirestore.instance
        .collection('propertyData')
        .doc('propertyListing')
        .collection('properties')
        .doc(id)
        .update({
      'views': FieldValue.increment(1),
    });

    // FirebaseFirestore.instance
    //     .collection('propertyData')
    //     .doc('propertyListing')
    //     .collection('properties')
    //     .doc(id)
    //     .get()
    //     .then((value) => FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(value['ownerId'])
    //         .collection('hosting')
    //         .doc('account')
    //         .update({'totalViews': FieldValue.increment(1)}));
    notifyListeners();
  }

  Future<void> addHistory(
    String propertyId,
  ) async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final history = FirebaseFirestore.instance
        .collection('userData')
        .doc('history')
        .collection(uid);
    final historyData = await history.get();

    if (historyData.docs.contains(propertyId)) {
      history.doc(propertyId).update({'createdAt': Timestamp.now()});
    } else {
      history.doc(propertyId).set({
        'createdAt': Timestamp.now(),
        'id': propertyId,
      });
    }
  }

  Future<void> fetchHistory() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final history = await FirebaseFirestore.instance
        .collection('userData')
        .doc('history')
        .collection(uid)
        .orderBy('createdAt')
        .get();
    List<PropertyModel> propData = [];

    Future.forEach(history.docs, (element) async {
      await FirebaseFirestore.instance
          .collection('propertyData')
          .doc('propertyListing')
          .collection('properties')
          .doc(element.id)
          .get()
          .then((e) => propData.add(PropertyModel(
                id: e.id,
                name: e['name'],
                coverImage: e['coverImage'],
                images: e['images'],
                ownerId: e['ownerId'],
                propertyTypes: e['propertyType'],
                description: e['description'],
                address: e['address'],
                price: e['price'],
              )));
    }).then((_) {
      _yourHistory = propData;
      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> fetchWishlist() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final history =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    List<PropertyModel> propData = [];
    List historyList = history.data()['wishlist'];

    await Future.forEach(historyList, (element) async {
      await FirebaseFirestore.instance
          .collection('propertyData')
          .doc('propertyListing')
          .collection('properties')
          .doc(element)
          .get()
          .then((e) => propData.add(PropertyModel(
                id: e.id,
                name: e['name'],
                coverImage: e['coverImage'],
                images: e['images'],
                ownerId: e['ownerId'],
                propertyTypes: e['propertyType'],
                description: e['description'],
                address: e['address'],
                price: e['price'],
              )));
    }).then((_) {
      _yourWishlist = propData;
      notifyListeners();
    });

    // print(_yourWishlist.first.name);

    notifyListeners();
  }
}
