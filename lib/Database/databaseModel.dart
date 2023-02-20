import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));
String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.userName,
    required this.password,
    required this.email,
  });

  Object id;
  String userName;
  String password;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "password": password,
        "email": email,
      };
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.coffeeName,
  });

  Object id;
  String coffeeName;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        coffeeName: json["coffeeName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "coffeeName": coffeeName,
      };
}

class OrderModel {
  OrderModel({
    required this.id,
    required this.coffeeName,
    required this.amount,
    required this.coffeeShot,
    required this.typeCoffee,
    required this.size,
    required this.price,
  });

  Object id;
  String coffeeName;
  int amount;
  String coffeeShot;
  String typeCoffee;
  String size;
  int price;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["_id"],
        coffeeName: json["coffeeName"],
        amount: json["amount"],
        coffeeShot: json["coffeeShot"],
        typeCoffee: json["typeCoffee"],
        size: json["size"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "coffeeName": coffeeName,
        "amount": amount,
        "coffeeShot": coffeeShot,
        "typeCoffee": typeCoffee,
        "size": size,
        "price": price,
      };
}
