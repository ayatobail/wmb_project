import 'package:flutter/material.dart';
import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/ui/shared/custom_widgets/custom_button.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../core/themes/app_colors.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/custom_widgets/details_widget.dart';
import '../../shared/utils.dart';
import 'artists_songs_controller.dart';

class ArtistsDetailsView extends StatefulWidget {
  const ArtistsDetailsView({super.key, required this.artist});

  final ArtistsModel artist;

  @override
  State<ArtistsDetailsView> createState() => _ArtistsDetailsViewState();
}

class _ArtistsDetailsViewState extends State<ArtistsDetailsView> {
  ArtistsSongsController controller1 = ArtistsSongsController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Artist details')),
        body: Obx(()
          =>Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(screenWidth(1)),
                elevation: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth(1)),
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: AppColors.grey,

                  ),
                ),
              ),
              SizedBox(height: 20,),
              CustomText(
                textType: TextStyleType.CUSTOM,
                text: "${widget.artist.fName} ${widget.artist.lName}",
                fontSize: screenWidth(15),
                textColor: AppColors.grey,
              ),
              SizedBox(height: 30,),
              DetailsWidget(title: "Gender", text: widget.artist.gender,icon: Icons.person_2_outlined,),
              DetailsWidget(
                title: "Country",
                text: widget.artist.country,
                  icon: Icons.person_2_outlined
              ),
              controller1.loading.value
                  ? CircularProgressIndicator(
                color: AppColors.primaryColor,
              )
                  :
              Visibility(
                visible: controller1.isVisible.value,
                  child: AppButton(
                onTap: () {
                  controller1.fetchSongsByArtist(widget.artist.id!);
                },
                buttonText: "view songs",
                btnWidth: 150,
              )),

                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller1.songs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Column(
                              children: [
                                CustomText(
                                    textType: TextStyleType.CUSTOM,
                                    fontSize: 20,
                                    text: controller1.songs[index])
                              ],
                            ),
                          ),
                        );
                      }),
                ),

              //DetailsWidget(title: "Songs", text:"Breathless",text2:"No promises" ,text3: "Stand by me"),
            ],
          ),
        ),
      ),
    );
  }
}
