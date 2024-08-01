import 'package:flutter/material.dart';
import 'package:food_pro/constant/app_size.dart';

class CardTileWidget extends StatelessWidget {
  final String img;
  final String type;
  final Widget icon;
  final VoidCallback onTap;

  const CardTileWidget({
    super.key,
    required this.img,
    required this.type,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        img,
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
      title: Text(
        type,
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: fontX*.018),
      ),
      trailing: icon,
      onTap: () {
        onTap();
      },
    );
  }
}
