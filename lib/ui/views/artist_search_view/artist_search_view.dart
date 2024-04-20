import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mwb_project/core/data/models/apis/artist_Model.dart';
import 'package:mwb_project/ui/views/artists_details_view/artists_detais_view.dart';
import 'package:mwb_project/ui/views/main_view/artists_view/artists_controller.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/themes/app_colors.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../../shared/utils.dart';

class ArtistSearchView extends StatefulWidget {
  const ArtistSearchView({super.key, required this.controller});

  final ArtistsController controller;

  @override
  State<ArtistSearchView> createState() => _ArtistSearchViewState();
}

class _ArtistSearchViewState extends State<ArtistSearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text('Search artist')),
            body: Column(children: [
              const SizedBox(height: 20),
              Autocomplete<ArtistsModel>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == "") {
                    return Iterable<ArtistsModel>.empty();
                  }
                  return widget.controller.artistsList
                      .where((suggestion) =>
                          suggestion.fName!
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()) ||
                          suggestion.lName!
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                        onFieldSubmitted) =>
                    Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    onSubmitted: (val) {
                      CustomToast.showMessage(
                          message: "no results",
                          messageType: MessageType.REJECTED);
                      //Get.to(ArtistsDetailsView());
                    },
                    controller: textEditingController,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    cursorColor: AppColors.primaryColor,
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'search artist',
                      labelStyle: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                      ),
                      focusColor: AppColors.primaryColor,
                    ),
                  ),
                ),
                displayStringForOption: (ArtistsModel artist) =>
                    "${artist.fName!} ${artist.lName}",
                optionsViewBuilder: ((context, onSelected, options) => Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: screenWidth(1),
                      child: Card(
                        elevation: 0,
                        color: AppColors.backgroundColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: options
                              .map((e) => InkWell(
                                  onTap: () {
                                    onSelected(e);
                                    Get.to(ArtistsDetailsView(
                                      artist: e,
                                    ));
                                  },
                                  child: ListTile(
                                    title: Text("${e.fName!} ${e.lName}"),
                                  )))
                              .toList(),
                        ),
                      ),
                    ))),
              )
            ])));
  }
}
