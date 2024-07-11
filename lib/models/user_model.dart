class UserModel {
  int? id;
  String name;
  String email;
  String telephone;
  String password;
  String confirmPassword;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.password,
    required this.confirmPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        telephone: json["telephone"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "telephone": telephone,
        "password": password,
        "confirmPassword": confirmPassword,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, telephone: $telephone, password: $password, confirmPassword: $confirmPassword}';
  }
}
