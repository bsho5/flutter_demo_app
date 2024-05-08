// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DealsModel {
  String id;
  String name;
  String serving;
  String time;
  int price;
  int oldPrice;
  DealsModel({
    required this.id,
    required this.name,
    required this.serving,
    required this.time,
    required this.price,
    required this.oldPrice,
  });

  DealsModel copyWith({
    String? id,
    String? name,
    String? serving,
    String? time,
    int? price,
    int? oldPrice,
  }) {
    return DealsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      serving: serving ?? this.serving,
      time: time ?? this.time,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'serving': serving,
      'time': time,
      'price': price,
      'oldPrice': oldPrice,
    };
  }

  factory DealsModel.fromMap(Map<String, dynamic> map) {
    return DealsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      serving: map['serving'] as String,
      time: map['time'] as String,
      price: map['price'] as int,
      oldPrice: map['oldPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealsModel.fromJson(String source) =>
      DealsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealsModel(id: $id, name: $name, serving: $serving, time: $time, price: $price, oldPrice: $oldPrice)';
  }

  @override
  bool operator ==(covariant DealsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.serving == serving &&
        other.time == time &&
        other.price == price &&
        other.oldPrice == oldPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        serving.hashCode ^
        time.hashCode ^
        price.hashCode ^
        oldPrice.hashCode;
  }
}
