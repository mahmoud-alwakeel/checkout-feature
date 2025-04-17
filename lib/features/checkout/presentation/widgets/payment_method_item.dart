import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    this.isActive = false,
  });

  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: 62,
      width: 103,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            color: isActive ? Colors.green : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? Colors.green : Colors.white,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 24,
            // mynf3sh tkbr 3an 7agmaha el tabe3y
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
