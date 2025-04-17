import 'package:checkout_feature/common/build_app_bar.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: Offset(0, -16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ThankYouCard(),
              Positioned(
                left: 30,
                right: 30,
                bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
                child: Row(
                  children: List.generate(
                    20,
                    (index) => Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        color: Color(0xffB8B8B8),
                        height: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.2,
                left: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.2,
                right: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                top: -50,
                right: 0,
                left: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFD9D9D9),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
