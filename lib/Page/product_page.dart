import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:work_ex1/Database/coffeedatabase.dart';
import 'package:work_ex1/Database/databaseModel.dart';
import 'order.dart';

class ProductPage extends StatefulWidget {
  String path;
  String name;
  ProductPage({Key? key, required this.path, required this.name})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // ******variable******\\
  int counter = 0;
  String typecoffee = '';
  String size = '';
  int price = 0;
  String ristreto = '';
  bool ristreto_ = false;
  bool Ristreto = false;
  bool light = false;
  List<String> path_type = [
    'images/icon/hotCoffeeIcon.png',
    'images/icon/coldCoffeeIcon.png'
  ];
  List<bool> icon_type = [false, false];
  List<String> path_size = [
    'images/icon/medium.png',
    'images/icon/medium.png',
    'images/icon/medium.png',
  ];
  List<bool> icon_size = [false, false, false];

  // ******variable******\\
  // *********************************Method*****************************************\\
  Widget showPicture() {
    String paht_ = widget.path;
    return Container(
        width: 350,
        height: 190,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 237, 235),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Image.asset(
              paht_,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
          ],
        ));
  }

  Widget plusButton() {
    return GestureDetector(
        onTap: () {
          setState(() {
            print('set');
            counter++;
          });
        },
        child: const Icon(Icons.add));
  }

  Widget lessenButton() {
    return GestureDetector(
        onTap: () => setState(() {
              counter == 0 ? print('counter at 0') : counter--;
            }),
        child: const Icon(Icons.remove));
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [lessenButton(), Text('$counter'), plusButton()],
    );
  }

  Widget nextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 50),
            primary: const Color.fromARGB(255, 88, 70, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: const Text('Order Confirmation?',
                    style: TextStyle(fontSize: 20)),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      addOrder(widget.name, counter, ristreto, typecoffee, size,
                          price);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderPage(
                                    path: widget.path,
                                    name: widget.name,
                                  )));
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
        child: const Text(
          'Next',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  Color color_() {
    if (ristreto_ == false) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color color2() {
    if (Ristreto == false) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  TextStyle text_() {
    if (ristreto_ == false) {
      return const TextStyle(color: Colors.black);
    } else {
      return const TextStyle(color: Colors.white);
    }
  }

  TextStyle text_2() {
    if (Ristreto == false) {
      return const TextStyle(color: Colors.black);
    } else {
      return const TextStyle(color: Colors.white);
    }
  }

  Future<void> addOrder(
    String coffeeName,
    int amount,
    String coffeeShot,
    String typeCoffee,
    String size,
    int price,
  ) async {
    var id = M.ObjectId();
    final data = OrderModel(
        id: id,
        coffeeName: coffeeName,
        amount: amount,
        coffeeShot: coffeeShot,
        typeCoffee: typeCoffee,
        size: size,
        price: price);
    await CoffeeDatabase.addOrderData(data);
  }

// *********************************Method*****************************************\\
// ************TextStyle************ \\
  TextStyle text = const TextStyle(fontWeight: FontWeight.bold);
  TextStyle total = const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  // ************TextStyle************ \\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Order',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            iconSize: 30,
          ),
        ],
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            showPicture(),
            const SizedBox(
              height: 20,
            ),
            // ** 1 ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: text,
                ),
                Container(
                    width: 75,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: showButton())
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // ** 2 ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ristretto',
                  style: text,
                ),
                Row(
                  children: [
                    Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: color_(),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ristreto_ = true;
                                  Ristreto = false;
                                  ristreto = 'One';
                                });
                              },
                              child: Text(
                                'One',
                                style: text_(),
                              )),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: color2(),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Ristreto = true;
                                  ristreto_ = false;
                                  ristreto = 'Two';
                                });
                              },
                              child: Text(
                                'Two',
                                style: text_2(),
                              )),
                        )),
                  ],
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // ** 3 ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot / Cold',
                  style: text,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            icon_type[0] = true;
                            icon_type[1] = false;
                            path_type[0] = 'images/icon/hotCoffeeIcon_.png';
                            path_type[1] = 'images/icon/coldCoffeeIcon.png';
                            typecoffee = 'Hot';
                          });
                        },
                        icon: Image.asset(path_type[0])),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            icon_type[1] = true;
                            icon_type[0] = false;
                            path_type[1] = 'images/icon/coldCoffeeIcon_.png';
                            path_type[0] = 'images/icon/hotCoffeeIcon.png';
                            typecoffee = 'Cold';
                          });
                        },
                        icon: Image.asset(path_type[1]))
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // ** 4 ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Volume,ml',
                  style: text,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                icon_size[0] = true;
                                icon_size[1] = false;
                                icon_size[2] = false;
                                path_size[0] = 'images/icon/medium_.png';
                                path_size[1] = 'images/icon/medium.png';
                                path_size[2] = 'images/icon/medium.png';
                                price = 250;
                                size = 'S';
                              });
                            },
                            icon: Image.asset(
                              path_size[0],
                              height: 20,
                            )),
                        Text(
                          '250',
                          style: text,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                icon_size[1] = true;
                                icon_size[0] = false;
                                icon_size[2] = false;
                                path_size[1] = 'images/icon/medium_.png';
                                path_size[0] = 'images/icon/medium.png';
                                path_size[2] = 'images/icon/medium.png';
                                price = 350;
                                size = 'M';
                              });
                            },
                            icon: Image.asset(
                              path_size[1],
                              height: 25,
                            )),
                        Text(
                          '350',
                          style: text,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                icon_size[2] = true;
                                icon_size[1] = false;
                                icon_size[0] = false;
                                path_size[2] = 'images/icon/medium_.png';
                                path_size[1] = 'images/icon/medium.png';
                                path_size[0] = 'images/icon/medium.png';
                                price = 450;
                                size = 'L';
                              });
                            },
                            icon: Image.asset(
                              path_size[2],
                              height: 30,
                            )),
                        Text(
                          '450',
                          style: text,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            // ** 5 ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prepare by a certain time today?',
                  style: text,
                ),
                SizedBox(
                  child: Switch(
                    // This bool value toggles the switch.
                    value: light,
                    activeColor: Colors.green,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // ** Tatal ** \\
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: total,
                ),
                Text(
                  '${counter * price} ฿',
                  style: total,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            nextButton(),
          ],
        ),
      )),
    );
  }
}
