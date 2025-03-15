import 'menu_model.dart';

class RestaurantModel {
  final String id;
  final String name;
  final double rating;
  final int deliveryTime;
  final double distance;
  final String imagePath;
  final List<MenuItemModel> menu;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.distance,
    required this.imagePath,
    required this.menu,
  });
}
