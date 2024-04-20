import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mwb_project/core/utils/app_sizes.dart';
import 'package:mwb_project/ui/views/artist_search_view/artist_search_view.dart';
import 'package:mwb_project/ui/views/main_view/artists_view/artists_controller.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/custom_widgets/app_text_field.dart';
import '../../../shared/custom_widgets/title_subtitle_column.dart';
import '../../../shared/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/get_core.dart';

class ArtistsView extends StatefulWidget {
  const ArtistsView({Key? key, required this.controller}) : super(key: key);
  final ArtistsController controller;

  @override
  _ArtistsViewState createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Artists'),
            scrolledUnderElevation: 0,
            elevation: 0),
        body: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.to(ArtistSearchView(
                    controller: widget.controller,
                  )),
                  child: AppTextField(
                    enable: false,
                    inputActionType: TextInputAction.search,
                    hintText: "search",
                    labelText: "search",
                    size: screenWidth(25),
                    round: screenWidth(1),
                    width: screenWidth(1),
                    prefIcon: Icons.search,
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    return widget.controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: widget.controller.artistsList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(12),),
                                color: Colors.white,
                                margin: EdgeInsets.all(12),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 20),
                                  child: Column(
                                    children: [
                                      TitleSubtitleColumn(
                                        artist: widget.controller.artistsList[index],
                                          title: 'Artist Name',
                                          subtitle:
                                              "${widget.controller.artistsList[index].fName} ${widget.controller.artistsList[index].lName}"),
                                      Divider(
                                        thickness: 1,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
