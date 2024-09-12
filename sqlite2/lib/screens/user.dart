class User {
  int? id;
  String? name;
  String? phone;
  String? age;
  String? weight;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['phone'] = phone!;
    mapping['age'] = age!;
    mapping['weight'] = weight!;
    return mapping;
  }
}
