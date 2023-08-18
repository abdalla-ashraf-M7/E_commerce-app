class CategoriesModel {
  String? catsId;
  String? catsName;
  String? catsNameAr;
  String? catsImage;
  String? catsDate;

  CategoriesModel({this.catsId, this.catsName, this.catsNameAr, this.catsImage, this.catsDate});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    catsId = json['cats_id'];
    catsName = json['cats_name'];
    catsNameAr = json['cats_name_ar'];
    catsImage = json['cats_image'];
    catsDate = json['cats_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cats_id'] = this.catsId;
    data['cats_name'] = this.catsName;
    data['cats_name_ar'] = this.catsNameAr;
    data['cats_image'] = this.catsImage;
    data['cats_date'] = this.catsDate;
    return data;
  }
}
