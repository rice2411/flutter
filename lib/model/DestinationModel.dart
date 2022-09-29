import 'dart:core';

class DestinationModel {
  final String id;
  final String name;
  final String images;
  final List<String> categories;
  final int rating;

  DestinationModel(
      this.id, this.name, this.images, this.categories, this.rating);

  static List<DestinationModel> MockData() {
    List<DestinationModel> list = [];
    list.add(DestinationModel("1", "Sushiiii", "assets/images/sushi/1.png",
        ["Cute", "cute", "cute"], 10));
    list.add(DestinationModel("2", "Sushiiiiiii", "assets/images/sushi/2.png",
        ["Cute", "cute", "cute"], 10));
    list.add(DestinationModel("3", "Su shi", "assets/images/sushi/3.png",
        ["Cute", "cute", "cute"], 10));
    return list;
  }
}
