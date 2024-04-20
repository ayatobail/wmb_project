import 'package:flutter/material.dart';
import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/core/data/models/apis/songs_model.dart';
import 'package:mwb_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:mwb_project/ui/views/song_details_view/song_details_controller.dart';
import '../../../core/themes/app_colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/details_widget.dart';
import '../../shared/utils.dart';

class SongDetailsView extends StatefulWidget {
  const SongDetailsView({
    Key? key,
    required this.song,
  }) : super(key: key);
  final SongsModel song;

  @override
  _SongDetailsViewState createState() => _SongDetailsViewState();
}

SongDetailsController controller = SongDetailsController();

class _SongDetailsViewState extends State<SongDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Song details')),
        body: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(screenWidth(1)),
              elevation: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth(1)),
                child: Image(
                    image: ResizeImage(AssetImage("assets/images/song.jpg"),
                        width: 120, height: 120)),
              ),
            ),
            CustomText(
              textType: TextStyleType.CUSTOM,
              text: widget.song.title!,
              fontSize: screenWidth(15),
              textColor: AppColors.grey,
            ),
            DetailsWidget(
                title: "Song Type",
                text: widget.song.type!,
                icon: Icons.queue_music_outlined),
            DetailsWidget(
                title: "Price",
                text: "${widget.song.price} \$",
                icon: Icons.queue_music_outlined),
            DetailsWidget(
                title: "Artist Name",
                text:
                    "${widget.song.artist!.fName} ${widget.song.artist!.lName}",
                icon: Icons.person_2_outlined),
            DetailsWidget(
                title: "Artist Gender",
                text: widget.song.artist!.gender,
                icon: Icons.person_2_outlined),
            DetailsWidget(
                title: "Artist Country",
                text: widget.song.artist!.country,
                icon: Icons.person_2_outlined),
            AppButton(
              color: AppColors.secondaryColor,
              btnWidth: screenWidth(4),
              onTap: () {
                controller.buySong(context);
              },
              buttonText: 'Buy now',
            ),
          ],
        ),
      ),
    );
  }
}
