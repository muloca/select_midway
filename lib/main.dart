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
      title: 'Select Item ',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final payment = Payments();

  int selected = 0;

  String title = 'Select Item & Group Items';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          width: 1000,
          height: 300,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemCount: payment.pay.length,
            itemBuilder: (_, i) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = i;
                      print(selected);
                    });
                  },
                  child: Column(
                    children: [
                      Text(payment.pay.elementAt(i)),
                      SelectCardComponent(
                        pay: payment.pay[i],
                        isSelect: (selected == i),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
