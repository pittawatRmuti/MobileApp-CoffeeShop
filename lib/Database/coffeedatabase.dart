import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:work_ex1/Database/databaseModel.dart';
import 'constant.dart';

class CoffeeDatabase {
  static dynamic db, userCollection, productCollection, orderCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    productCollection = db.collection(PRODUCT_COLLECTION);
    orderCollection = db.collection(ORDER_COLLECTION);
  }

  // ***** User ***** \\
  static Future<String> addUserData(UserModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data add Success";
      } else {
        return "Something Wrong try again";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getUserData() async {
    final userData = await userCollection.find().toList();
    return userData;
  }

  // ***** Product ***** \\
  static Future<String> addProductData(ProductModel data) async {
    try {
      var result = await productCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data add Success";
      } else {
        return "Something Wrong try again";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getProductData() async {
    final productData = await productCollection.find().toList();
    return productData;
  }

  // ***** Order ***** \\
  static Future<dynamic> addOrderData(OrderModel data) async {
    try {
      var result = await orderCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data add Success";
      } else {
        return "Something Wrong try again";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getOrderData() async {
    final getorederaata = await orderCollection.find().toList();
    return getorederaata;
  }
}
