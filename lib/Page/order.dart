import 'package:flutter/material.dart';
import 'package:work_ex1/Database/coffeedatabase.dart';
import 'package:work_ex1/Database/databaseModel.dart';
import 'coffeepage.dart';

class OrderPage extends StatefulWidget {
  String path;
  String name;
  OrderPage({Key? key, required this.path, required this.name})
      : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // ******variable******\\

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

  Widget nextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 50),
            primary: const Color.fromARGB(255, 88, 70, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PageCoffee()));
        },
        child: const Text(
          'Next',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

// *********************************Method*****************************************\\
// ************TextStyle************ \\
  TextStyle text = const TextStyle(fontSize: 17);
  TextStyle total = const TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  // ************TextStyle************ \\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Order List',
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
        child: SafeArea(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: CoffeeDatabase.getOrderData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return showData_(
                                OrderModel.fromJson(snapshot.data.last));
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('No Data'),
                        );
                      }
                    }
                  },
                ))),
      ),
    );
  }

  Widget showData_(OrderModel data) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        showPicture(),
        const SizedBox(
          height: 20,
        ),
        // ** 1 ** \\
        Text(
          widget.name,
          style: TextStyle(fontSize: 25),
        ),
        const Divider(),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            width: 250,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount',
                      style: text,
                    ),
                    Text(
                      data.amount.toString(),
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ristretto',
                      style: text,
                    ),
                    Text(
                      data.coffeeShot,
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hot/Cold',
                      style: text,
                    ),
                    Text(
                      data.typeCoffee,
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size',
                      style: text,
                    ),
                    Text(
                      data.size,
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: text,
                    ),
                    Text(
                      data.price.toString(),
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amounts',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      '${data.amount * data.price}',
                      style: text,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
              ],
            )),
        nextButton(),
      ],
    );
  }
}
