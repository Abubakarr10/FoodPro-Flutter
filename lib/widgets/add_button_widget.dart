import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onTap;

  const AddButtonWidget({
    super.key,
    this.width,
    this.height, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width??50,
        height: height??50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle,
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
              color: Colors.amber[300]!,
              blurRadius: 15.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.add,
            size: 20,
          ),
        ),
      ),
    );
  }
}
