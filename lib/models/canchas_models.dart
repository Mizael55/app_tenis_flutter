class CanchasModels {
  int? id;
  String title;
  String type;
  String image;
  String price;
  bool available;
  String starthour;
  String endhour;
  int reserveNum;

  CanchasModels({
    this.id,
    required this.title,
    required this.type,
    required this.image,
    required this.price,
    required this.available,
    required this.starthour,
    required this.endhour,
    required this.reserveNum,
  });

  factory CanchasModels.fromJson(Map<String, dynamic> json) => CanchasModels(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        available: json["available"],
        starthour: json["starthour"],
        endhour: json["endhour"],
        reserveNum: json["reserveNum"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "image": image,
        "price": price,
        "available": available,
        "starthour": starthour,
        "endhour": endhour,
        "reserveNum": reserveNum,
      };

  @override
  String toString() {
    return 'CanchasModels{id: $id, title: $title, type: $type, image: $image, price: $price, available: $available, starthour: $starthour, endhour: $endhour, reserveNum: $reserveNum}';
  }
}
