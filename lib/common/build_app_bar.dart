
  import 'package:checkout_feature/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({required final String title}) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          'assets/icons/back_arrow_icon.svg',
          width: 24,
        ),
      ),
      title: Text(
        title,
        style: Styles.style25,
      ),
      centerTitle: true,
    );
  }

