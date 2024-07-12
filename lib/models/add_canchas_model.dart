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
      };

  @override
  String toString() {
    return 'CanchasModels{id: $id, title: $title, type: $type, image: $image, price: $price, starthour: $starthour, endhour: $endhour, date: $date, comment: $comment, renter: $renter, instructor: $instructor, horas: $horas, weather: $weather}';
  }
}
