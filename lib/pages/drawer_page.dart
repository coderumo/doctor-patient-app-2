import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawerPage extends StatefulWidget {
  const MyDrawerPage({super.key});

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text('merhaba gerizekalı')),
          ListTile(
            title: Text('Profili görüntüle'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Uygulama hakkında'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
