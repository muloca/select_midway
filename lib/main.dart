import 'package:flutter/material.dart';
import 'package:selection/component/select_radio.dart';
import 'package:selection/component/selection_componet.dart';
import 'component/selection_card.dart';

class Payments {
  List pay = ['Dinheiro', 'Débito', 'Crédito'];
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Select Item',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  final payment = Payments();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Item'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionComponent(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioSelect(),
              ),
              GridView(
                padding: EdgeInsets.symmetric(vertical: 4),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.5),
                children: payment.pay.map((p) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        pay = p;
                      });
                    },
                    child: Container(
                      child: p,
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
