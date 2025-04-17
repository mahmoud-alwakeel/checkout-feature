
import 'package:checkout_feature/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: Colors.green,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),),
        child: Center(child: Text('Complete Payment', style: Styles.style22,)),
      ),
    );
  }
}
