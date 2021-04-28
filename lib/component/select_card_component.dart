import 'package:flutter/material.dart';

class SelectCardComponent extends StatelessWidget {
  final String pay;
  final bool isSelect;

  const SelectCardComponent(
      {Key key, @required this.pay, @required this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160,
        height: 96,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: isSelect == true ? Colors.grey[100] : Colors.white,
          child: Container(
              width: 160,
              height: 92,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: isSelect == true ? Colors.teal : Colors.grey[200],
                      width: 1)),
              child: ListTile(
                trailing: Icon(
                  Icons.check_circle,
                  textDirection: TextDirection.rtl,
                  color: isSelect == true ? Colors.teal : Colors.transparent,
                ),
                title: Center(
                  child: Icon(
                    Icons.ac_unit_sharp,
                    size: 60,
                    color: Colors.grey[400],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
