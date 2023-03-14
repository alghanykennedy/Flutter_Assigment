import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.data,
  });

  final List<Datum>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.section,
    this.sectionTitle,
    this.items,
  });

  final String? section;
  final String? sectionTitle;
  final List<Item>? items;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        section: json["section"],
        sectionTitle: json["section_title"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "section_title": sectionTitle,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.articleTitle,
    this.articleImage,
    this.link,
    this.productName,
    this.productImage,
  });

  final String? articleTitle;
  final String? articleImage;
  final String? link;
  final String? productName;
  final String? productImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        articleTitle: json["article_title"],
        articleImage: json["article_image"],
        link: json["link"],
        productName: json["product_name"],
        productImage: json["product_image"],
      );

  Map<String, dynamic> toJson() => {
        "article_title": articleTitle,
        "article_image": articleImage,
        "link": link,
        "product_name": productName,
        "product_image": productImage,
      };
}
