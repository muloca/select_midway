import 'package:flutter/material.dart';
import 'component/select_card_component.dart';

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

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Item'),
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 300,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 4),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 2, childAspectRatio: 0.5),
              itemCount: payment.pay.length,
              itemBuilder: (_, i) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = i;
                        print(selected);
                      });
                    },
                    child: SelectCardComponent(
                      pay: payment.pay[i],
                      isSelect: (selected == i),
                    ));
              }),
        ),
      ),
    );
  }
}
