class AddCanchasModel {
  int? id;
  String title;
  String type;
  String image;
  String price;
  String starthour;
  String endhour;
  String date;
  String? comment;
  String renter;
  String instructor;
  String? horas;
  String? weather;
  DateTime? createdAt;
  String canchaType;

  AddCanchasModel({
    this.id,
    required this.title,
    required this.type,
    required this.image,
    required this.price,
    required this.starthour,
    required this.endhour,
    required this.date,
    this.comment,
    required this.renter,
    required this.instructor,
    this.horas,
    this.weather,
    this.createdAt,
    required this.canchaType,
  });

  factory AddCanchasModel.fromJson(Map<String, dynamic> json) =>
      AddCanchasModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        starthour: json["starthour"],
        endhour: json["endhour"],
        date: json["date"],
        comment: json["comment"],
        renter: json["renter"],
        instructor: json["instructor"],
        horas: json["horas"],
        weather: json["weather"],
        createdAt: DateTime.parse(json["created_at"]),
        canchaType: json["canchaType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "image": image,
        "price": price,
        "starthour": starthour,
        "endhour": endhour,
        "date": date,
        "comment": comment,
        "renter": renter,
        "instructor": instructor,
        "horas": horas,
        "weather": weather,
        "created_at": createdAt!.toIso8601String(),
        "canchaType": canchaType,
      };

  @override
  String toString() {
    return 'CanchasModels{id: $id, title: $title, type: $type, image: $image, price: $price, starthour: $starthour, endhour: $endhour, date: $date, comment: $comment, renter: $renter, instructor: $instructor, horas: $horas, weather: $weather, createdAt: $createdAt, canchaType: $canchaType}';
  }
}
