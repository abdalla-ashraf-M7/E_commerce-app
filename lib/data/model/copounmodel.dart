class CopounModel {
  String? copounId;
  String? copounName;
  String? copounDiscount;
  String? copounCount;
  String? copounDate;
  String? copounExpire;

  CopounModel({this.copounId, this.copounName, this.copounDiscount, this.copounCount, this.copounDate, this.copounExpire});

  CopounModel.fromJson(Map<String, dynamic> json) {
    copounId = json['copoun_id'];
    copounName = json['copoun_name'];
    copounDiscount = json['copoun_discount'];
    copounCount = json['copoun_count'];
    copounDate = json['copoun_date'];
    copounExpire = json['copoun_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copoun_id'] = this.copounId;
    data['copoun_name'] = this.copounName;
    data['copoun_discount'] = this.copounDiscount;
    data['copoun_count'] = this.copounCount;
    data['copoun_date'] = this.copounDate;
    data['copoun_expire'] = this.copounExpire;
    return data;
  }
}
