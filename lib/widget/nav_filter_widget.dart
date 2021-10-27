import 'package:app/controllers/reddit_offline.dart';
import 'package:mvc_application/controller.dart';
import 'package:mvc_application/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../roddit_colors.dart';

class NavigationFilterWidget extends StatefulWidget {
  final Function(OfflineGetType) callback;

  const NavigationFilterWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigationFilterWidget();
}

class _NavigationFilterWidget extends State<NavigationFilterWidget> {
  OfflineGetType _value = OfflineGetType.hot;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PopupMenuButton<OfflineGetType>(
            color: RodditColors.pink,
            icon: const Icon(
                Icons.filter_list_rounded,
                color: Colors.white),
            initialValue: _value,
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.local_fire_department, color: Colors.red),
                  Text("Hot", style: TextStyle(color: Colors.white,))
                ]),
                value: OfflineGetType.hot,
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.verified_outlined, color: Colors.lightGreen),
                  Text("New", style: TextStyle(color: Colors.white,))
                ]),
                value: OfflineGetType.newest,
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.moving_rounded, color: Colors.deepPurple),
                  Text("Rising", style: TextStyle(color: Colors.white,))
                ]),
                value: OfflineGetType.rising,
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.bar_chart_rounded, color: Colors.tealAccent),
                  Text("Top", style: TextStyle(color: Colors.white,))
                ]),
                value: OfflineGetType.top,
              ),
              PopupMenuItem(
                child: Row(children: const [
                  Icon(Icons.flash_on_rounded, color: Colors.amber),
                  Text("Controversial", style: TextStyle(color: Colors.white,))
                ]),
                value: OfflineGetType.controversial,
              ),
            ],
            onSelected: (OfflineGetType newValue) {
              setState(() {
                _value = newValue;
                widget.callback(newValue);
              });
            },
          )
        ]
    );
  }
}