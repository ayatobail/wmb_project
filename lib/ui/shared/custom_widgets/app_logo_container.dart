import 'package:flutter/material.dart';
import 'package:mwb_project/ui/shared/custom_widgets/custom_text.dart';

class AppLogoContainer extends StatelessWidget {
  const AppLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
        image: ResizeImage(AssetImage('assets/images/logo.png'),
            width: 190, height: 190));
  }
}
