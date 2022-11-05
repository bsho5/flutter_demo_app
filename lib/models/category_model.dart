// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter_demo_app/models/item_model.dart';

// class CategoryModel {
//   String name;
//   String id;
//   ItemModel items;
//   CategoryModel({
//     required this.name,
//     required this.id,
//     required this.items,
//   });

//   CategoryModel copyWith({
//     String? name,
//     String? id,
//     ItemModel? items,
//   }) {
//     return CategoryModel(
//       name: name ?? this.name,
//       id: id ?? this.id,
//       items: items ?? this.items,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'id': id,
//       'items': items.toMap(),
//     };
//   }

//   factory CategoryModel.fromMap(Map<String, dynamic> map) {
//     return CategoryModel(
//       name: map['name'] as String,
//       id: map['id'] as String,
//       items: ItemModel.fromMap(map['items'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CategoryModel.fromJson(String source) =>
//       CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'CategoryModel(name: $name, id: $id, items: $items)';

//   @override
//   bool operator ==(covariant CategoryModel other) {
//     if (identical(this, other)) return true;

//     return other.name == name && other.id == id && other.items == items;
//   }

//   @override
//   int get hashCode => name.hashCode ^ id.hashCode ^ items.hashCode;
// }

import 'package:flutter_demo_app/models/item_model.dart';

class CategoryModel {
  String? id;
  String? name;
  List<ItemModel>? items;

  CategoryModel({this.id, this.name, this.items});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items!.add(new ItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

