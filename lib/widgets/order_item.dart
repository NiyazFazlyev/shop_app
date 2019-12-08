import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem>
    with SingleTickerProviderStateMixin {
  var expanded = false;

//  AnimationController _controller;
//  Animation<Offset> _slideAnimation;

//  @override
//  void initState() {
//    _controller = AnimationController(
//      vsync: this,
//      duration: Duration(
//        milliseconds: 300,
//      ),
//    );
//    _slideAnimation = Tween<Offset>(
//      begin: Offset(0, -1.5),
//      end: Offset(0, 0),
//    ).animate(CurvedAnimation(
//      parent: _controller,
//      curve: Curves.linear,
//    ));
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: expanded? min(widget.order.products.length * 20.0 + 110, 200): 95,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                DateFormat('dd.MM.yyyy hh:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                icon:
                    expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
//                  if (expanded) {
//                    _controller.forward();
//                  } else {
//                    _controller.reverse();
//                  }
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: expanded
                  ? min(widget.order.products.length * 20.0 + 10, 100)
                  : 0,
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity} x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
