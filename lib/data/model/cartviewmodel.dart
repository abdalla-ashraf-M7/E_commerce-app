class CartViewModel {
  String? itemtotalprice;
  String? itemtotalpriceAfterdiscount;
  String? itemcountInOrder;
  String? cartId;
  String? cartUsers;
  String? cartItems;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCountInDB;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCats;

  CartViewModel(
      {this.itemtotalprice,
      this.itemtotalpriceAfterdiscount,
      this.itemcountInOrder,
      this.cartId,
      this.cartUsers,
      this.cartItems,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCountInDB,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCats});

  CartViewModel.fromJson(Map<String, dynamic> json) {
    itemtotalprice = json['itemprice'];
    itemtotalpriceAfterdiscount = json['itempriceafterdiscount'];
    itemcountInOrder = json['itemcount'];
    cartId = json['cart_id'];
    cartUsers = json['cart_users'];
    cartItems = json['cart_items'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCountInDB = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCats = json['items_cats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemprice'] = this.itemtotalprice;
    data['itempriceafterdiscount'] = this.itemtotalpriceAfterdiscount;
    data['itemcount'] = this.itemcountInOrder;
    data['cart_id'] = this.cartId;
    data['cart_users'] = this.cartUsers;
    data['cart_items'] = this.cartItems;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCountInDB;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cats'] = this.itemsCats;
    return data;
  }
}
