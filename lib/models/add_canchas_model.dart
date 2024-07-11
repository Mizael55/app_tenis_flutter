class AddCanchasModel {
  int? id;
  String title;
  String type;
  String image;
  String price;
  String starthour;
  String endhour;
  int total;
  String date;
  String? comment;
  String renter;
  String instructor;

  AddCanchasModel({
    this.id,
    required this.title,
    required this.type,
    required this.image,
    required this.price,
    required this.starthour,
    required this.endhour,
    required this.total,
    required this.date,
    this.comment,
    required this.renter,
    required this.instructor,
  });

  factory AddCanchasModel.fromJson(Map<String, dynamic> json) => AddCanchasModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        starthour: json["starthour"],
        endhour: json["endhour"],
        total: json["total"],
        date: json["date"],
        comment: json["comment"],
        renter: json["renter"],
        instructor: json["instructor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "image": image,
        "price": price,
        "starthour": starthour,
        "endhour": endhour,
        "total": total,
        "date": date,
        "comment": comment,
        "renter": renter,
        "instructor": instructor,
      };

  @override
  String toString() {
    return 'CanchasModels{id: $id, title: $title, type: $type, image: $image, price: $price, starthour: $starthour, endhour: $endhour, total: $total, date: $date, comment: $comment, renter: $renter, instructor: $instructor}';
  }
}
