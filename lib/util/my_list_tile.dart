import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final Icon? iconn;
  final String text;
  final void Function()? onTap;

  const MyListTile(
      {super.key,
      required this.icon,
      required this.text,
      this.onTap,
      this.iconn});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      // trailing: const Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,),
      trailing: iconn,
    );
  }
}
