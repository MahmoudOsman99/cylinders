class TroubleshootModel {
  final String ID;
  final String name;
  final String description;
  final String reference;
  final List<String>? images;
  final String solve;
  final String symptoms;

  TroubleshootModel({
    required this.ID,
    required this.name,
    required this.description,
    required this.reference,
    this.images,
    required this.solve,
    required this.symptoms,
  });

  factory TroubleshootModel.fromJson(Map<String, dynamic> json) {
    return TroubleshootModel(
      ID: json['ID'],
      name: json['name'],
      description: json['description'],
      reference: json['reference'],
      solve: json['solve'],
      images: json['images'],
      symptoms: json['symptoms'],
    );
  }
}
