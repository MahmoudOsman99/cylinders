class Question {
  final String? ID;
  final String name;
  final String descrition;
  final String solve;
  final List<String>? images;

  Question({
    this.ID,
    required this.name,
    required this.descrition,
    required this.solve,
    this.images,
  });
}
