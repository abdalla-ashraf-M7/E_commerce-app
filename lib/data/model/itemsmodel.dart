class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCats;
  String? catsId;
  String? catsName;
  String? catsNameAr;
  String? catsImage;
  String? catsDate;
  String? favs;
  String? priceAfterDiscount;

  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCats,
    this.catsId,
    this.catsName,
    this.catsNameAr,
    this.catsImage,
    this.catsDate,
    this.favs,
    this.priceAfterDiscount,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCats = json['items_cats'];
    catsId = json['cats_id'];
    catsName = json['cats_name'];
    catsNameAr = json['cats_name_ar'];
    catsImage = json['cats_image'];
    catsDate = json['cats_date'];
    favs = json['favs'];
    priceAfterDiscount = json['priceafterdiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cats'] = this.itemsCats;
    data['cats_id'] = this.catsId;
    data['cats_name'] = this.catsName;
    data['cats_name_ar'] = this.catsNameAr;
    data['cats_image'] = this.catsImage;
    data['cats_date'] = this.catsDate;
    data['favs'] = this.favs;
    data['priceafterdiscount'] = this.priceAfterDiscount;
    return data;
  }
}
