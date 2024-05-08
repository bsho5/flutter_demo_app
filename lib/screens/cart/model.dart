// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class CartModel {
  String id;
  int price;
  int count;
  String name;

  String serving;

  CartModel({
    required this.id,
    required this.price,
    required this.count,
    required this.name,
    required this.serving,
  });

  CartModel copyWith({
    String? id,
    int? price,
    int? count,
    String? name,
    String? serving,
    Color? color,
  }) {
    return CartModel(
      id: id ?? this.id,
      price: price ?? this.price,
      count: count ?? this.count,
      name: name ?? this.name,
      serving: serving ?? this.serving,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'count': count,
      'name': name,
      'serving': serving,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as String,
      price: map['price'] as int,
      count: map['count'] as int,
      name: map['name'] as String,
      serving: map['serving'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, price: $price, count: $count, name: $name, serving: $serving)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.price == price &&
        other.count == count &&
        other.name == name &&
        other.serving == serving;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        count.hashCode ^
        name.hashCode ^
        serving.hashCode;
  }
}
