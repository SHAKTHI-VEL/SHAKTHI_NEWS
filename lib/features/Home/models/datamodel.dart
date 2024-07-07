class DataModel{
  final String _id;
  final String name;
  final String language;
  final String description;
  final int price;
  final String imageUrl;
  final int __v;
  final String createdAt;
  final String updatedAt;

  DataModel({required String id, required this.name, required this.language, required this.description, required this.price, required this.imageUrl, required int v, required this.createdAt, required this.updatedAt}) : _id = id, __v = v;

}