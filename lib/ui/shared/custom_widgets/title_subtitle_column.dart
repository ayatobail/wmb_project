import 'package:flutter/material.dart';
import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/ui/views/artists_details_view/artists_detais_view.dart';
import '../../../core/themes/app_colors.dart';
import '../utils.dart';
import 'colored_text.dart';
import 'label_text.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class TitleSubtitleColumn extends StatelessWidget {
  const TitleSubtitleColumn({
    super.key,
    required this.title,
    this.subtitle,
    this.color,
    this.htmlView,
    this.size, required this.artist,
  });

  final String title;
  final String? subtitle;
  final Color? color;
  final dynamic? htmlView;
  final double? size;
  final ArtistsModel artist;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(
              labelText: title,
              padding: 0,
              color: color,
            ),
            Text(
              subtitle ?? "",
              softWrap: true,
              maxLines: 2,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: size ?? 20),
            ),



          ],
        ),
       //Spacer(),
        InkWell(
          onTap:()=> Get.to(ArtistsDetailsView(artist:artist ,)),
          child: ColoredText(
            text: 'view details',
            textColor: AppColors.primaryColor,
            size: screenWidth(28),
          ),
        ),

      ],
    );
  }
}
