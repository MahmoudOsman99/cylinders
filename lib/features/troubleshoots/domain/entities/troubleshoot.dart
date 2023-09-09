class Troubleshoot {
  late String? ID;
  late String name;
  late String descrition;
  late String solve;
  late List<String>? images;

  Troubleshoot({
    this.ID,
    required this.name,
    required this.descrition,
    required this.solve,
    this.images,
  });
}
