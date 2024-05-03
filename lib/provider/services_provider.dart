import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:the_homy/model/services.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceState state = ServiceState.loading;
  late List<MyService> _serviceList;
  late Future<List<String>> _bannerList;

  // Initialize the provider and fetch data from Firebase
  ServiceProvider() {
    _serviceList = [];
    state = ServiceState.loading;
    _bannerList=getBannerImages();
    _fetchData();
  }

  List<MyService> get serviceList => _serviceList;
  Future<List<String>> get bannerList => _bannerList;

  Future<List<String>> getBannerImages() async {
    // Replace 'banners' with your Firebase Storage folder path
    Reference ref = FirebaseStorage.instance.ref('banners');
    ListResult result = await ref.listAll();
    List<String> imageUrls = [];
    for (Reference imageRef in result.items) {
      String downloadUrl = await imageRef.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

  void _fetchData() async {
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('IOS/Service');
    // Listen for events from the database
    reference.onValue.listen((event) {
      event.snapshot.children.forEach((element) {
        if (element.exists) {
          state = ServiceState.loading;
          var value = element.value as Map<dynamic, dynamic>;
          MyService service = MyService(
              name: value['Name'], function: value['Fun'], image: value['Img']
              );

          _serviceList.add(service);
        }
      });
      state = ServiceState.loaded;
      notifyListeners();
    }, onError: (Object error) {
      state = ServiceState.error;
      notifyListeners();
      // Handle errors here
      print('Error fetching data: $error');
    });
  }
}

// _serviceList.clear();
// DataSnapshot db = event.snapshot;
// if (event.snapshot.exists) {
//   List data = db.value as List;
//   print(data.length);
//   //print(data);
//   _serviceList.clear();
//   for (var ser in data) {
//     ser as Map<dynamic, dynamic>?;
//     print(ser);
//     MyService employee = MyService(
//       name: ser?['Name'] ?? 'something else',
//       image: ser?['Img'] ?? 123,
//       function: ser?['Fun'] ?? "something",
//     );
//     _serviceList.add(employee);
//     // ser?.forEach((key, value) {

//     //   _serviceList.add(employee);
//     // });
//   }
//   state = ServiceState.loaded;

//   // Notify listeners that data has been updated
//   notifyListeners();
//}

// Function to fetch data from Firebase
// void _fetchData() {
//   DatabaseReference reference = FirebaseDatabase.instance.ref('Data/Service');
//   reference.once().then((DataSnapshot snapshot) {
//     Map<dynamic, dynamic> data = Map<dynamic,dynamic>.from(snapshot.value as Map) ;
//     data.forEach((key, value) {
//       MyService employee = MyService(
//         name: value['Name'],
//         image: value['Img'],
//         function: value['Fun'],
//         benefits: List<String>.from(value['Benefits']),
//       );
//       _serviceList.add(employee);
//     });
//     // Notify listeners that data has been updated
//     notifyListeners();
//   } as FutureOr Function(DatabaseEvent value));
// }

enum ServiceState {
  loaded,
  loading,
  error,
}
