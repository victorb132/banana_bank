class User {
  final String? id;
  final String name;
  final String email;
  final String cep;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.cep,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cep: json['cep'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'cep': cep,
    };
  }
}
