// ignore_for_file: public_member_api_docs, sort_constructors_first


class ItemModel {
  String? id;
  String? name;
  int? price;
  String? serving;

  ItemModel({this.id, this.name, this.price, this.serving});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    serving = json['serving'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['serving'] = serving;
    return data;
  }
}