class ArtistsModel {
  int? id;
  String? fName;
  String? lName;
  String? gender;
  String? country;
  String? songs;

  ArtistsModel({this.id, this.fName, this.lName, this.gender, this.country,this.songs});

  ArtistsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['fName'];
    lName = json['lName'];
    gender = json['gender'];
    country = json['country'];
    //country = json['songs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['songs'] = this.songs;
    return data;
  }
}