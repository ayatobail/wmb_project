class SongsModel {
  int? id;
  String? title;
  String? type;
  dynamic? price;
  int? artistId;
  Artist? artist;

  SongsModel(
      {this.id, this.title, this.type, this.price, this.artistId, this.artist});

  SongsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    artistId = json['artistId'];
    artist =
    json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['price'] = this.price;
    data['artistId'] = this.artistId;
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    return data;
  }
}

class Artist {
  int? id;
  String? fName;
  String? lName;
  String? gender;
  String? country;

  Artist({this.id, this.fName, this.lName, this.gender, this.country});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['fName'];
    lName = json['lName'];
    gender = json['gender'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['gender'] = this.gender;
    data['country'] = this.country;
    return data;
  }
}