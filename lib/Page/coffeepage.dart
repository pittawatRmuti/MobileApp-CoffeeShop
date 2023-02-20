import 'package:flutter/material.dart';
import 'package:work_ex1/Database/coffeedatabase.dart';
import 'package:work_ex1/Database/databaseModel.dart';
import 'product_page.dart';
import '../Model/item.dart';

class PageCoffee extends StatelessWidget {
  const PageCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeePage(),
    );
  }
}

class CoffeePage extends StatefulWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

const TextStyle textTop = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
const TextStyle textTop2 = TextStyle(fontSize: 20);
Item item = Item();

class _CoffeePageState extends State<CoffeePage> {
  // ******variable******\\
  List<String> namePaht = [];
  // ******variable******\\

  // *********************************Method*****************************************\\
  Widget footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Image.asset('images/icon/shop.png')),
        IconButton(onPressed: () {}, icon: Image.asset('images/icon/gift.png')),
        IconButton(
            onPressed: () {}, icon: Image.asset('images/icon/order.png')),
      ],
    );
  }

  Widget displayCard(int index, ProductModel data) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => ProductPage(
                      path: namePaht[index],
                      name: data.coffeeName,
                    ))));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Image.asset(
                    namePaht[index],
                    width: 100,
                    height: 90,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.coffeeName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }

  void setDataCard() {
    item.setPath('images/Americano.png');
    item.setPath('images/Cappuccino.png');
    item.setPath('images/Espresso.png');
    item.setPath('images/Macchiato.png');
    item.setPath('images/Latte.png');
    item.setPath('images/Mocha.png');
  }

  @override
  void initState() {
    setDataCard();
    namePaht = item.getPath();
    super.initState();
  }

  // *********************************Method*****************************************\\
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline_sharp),
            color: Colors.black,
            iconSize: 30,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'What is your choice?',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 88, 70, 50),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: FutureBuilder(
                        future: CoffeeDatabase.getProductData(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2 / 2.3),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return displayCard(
                                      index,
                                      ProductModel.fromJson(
                                          snapshot.data[index]));
                                },
                              );
                            } else {
                              return const Center(
                                child: Text('No has data'),
                              );
                            }
                          }
                        },
                      )),
                ),
                Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: footer())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
