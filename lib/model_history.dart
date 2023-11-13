class Student {
  final String email;
  final String name;
  final int age;
  final String rollNo;
//constructor
  Student({
    required this.email,
    required this.name,
    required this.age,
    required this.rollNo,
  });
  Map<String, dynamic> mapStudent() {
    return {
      'email': email,
      'name': name,
      'age': age,
      'rollNo': rollNo,
    };
  }
}
