import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class PromoRestaurantData {
  static List<RestaurantModel> getPromoRestaurants() {
    return [
      RestaurantModel(
        id: 'burger_sabai',
        name: 'Burger Sabai',
        rating: 4.3,
        deliveryTime: 20,
        distance: 2.8,
        imagePath: 'assets/images/fast-food.png',
        menu: [
          MenuItemModel(
            id: 'burger_sabai_1',
            name: 'Classic Burger',
            price: 99,
            image: 'assets/images/food-container.png',
            description: 'Juicy beef burger with fresh ingredients',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_rim_thanon',
        name: 'Ruen Rim Thanon',
        rating: 4.5,
        deliveryTime: 30,
        distance: 3.8,
        imagePath: 'assets/images/restaurant.png',
        menu: [
          MenuItemModel(
            id: 'ruen_rim_1',
            name: 'Thai Classic Dish',
            price: 129,
            image: 'assets/images/food-container.png',
            description: 'Traditional Thai cuisine',
          ),
        ],
      ),
      RestaurantModel(
        id: 'cafe_baan_suan',
        name: 'Cafe Baan Suan',
        rating: 4.2,
        deliveryTime: 25,
        distance: 3.0,
        imagePath: 'assets/images/coffee-shop.png',
        menu: [
          MenuItemModel(
            id: 'cafe_baan_1',
            name: 'Cafe Latte',
            price: 59,
            image: 'assets/images/food-container.png',
            description: 'Smooth and creamy cafe latte',
          ),
        ],
      ),
      RestaurantModel(
        id: 'kin_dee_delivery',
        name: 'Kin Dee Delivery',
        rating: 4.6,
        deliveryTime: 15,
        distance: 2.0,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'kin_dee_1',
            name: 'Delivery Special',
            price: 89,
            image: 'assets/images/food-container.png',
            description: 'Delicious meal for quick delivery',
          ),
        ],
      ),
      RestaurantModel(
        id: 'rod_ded_rim_thang',
        name: 'Rod Ded Rim Thang',
        rating: 4.4,
        deliveryTime: 25,
        distance: 2.8,
        imagePath: 'assets/images/restaurant (2).png',
        menu: [
          MenuItemModel(
            id: 'rod_ded_1',
            name: 'Special Rod Ded',
            price: 109,
            image: 'assets/images/food-container.png',
            description: 'Signature dish of Rod Ded Rim Thang',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_halal_thai',
        name: 'Ruen Halal Thai',
        rating: 4.7,
        deliveryTime: 30,
        distance: 3.5,
        imagePath: 'assets/images/restaurant (3).png',
        menu: [
          MenuItemModel(
            id: 'ruen_halal_1',
            name: 'Halal Delight',
            price: 139,
            image: 'assets/images/food-container.png',
            description: 'Authentic Halal Thai cuisine',
          ),
        ],
      ),
      RestaurantModel(
        id: 'baan_kanom_thai',
        name: 'Baan Kanom Thai',
        rating: 4.5,
        deliveryTime: 20,
        distance: 2.6,
        imagePath: 'assets/images/restaurant (4).png',
        menu: [
          MenuItemModel(
            id: 'baan_kanom_1',
            name: 'Thai Dessert Combo',
            price: 79,
            image: 'assets/images/food-container.png',
            description: 'Assorted traditional Thai sweets',
          ),
        ],
      ),
      RestaurantModel(
        id: 'kuay_tiew_rim_klong',
        name: 'Kuay Tiew Rim Klong',
        rating: 4.6,
        deliveryTime: 18,
        distance: 2.3,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'kuay_tiew_1',
            name: 'Rim Klong Noodles',
            price: 69,
            image: 'assets/images/food-container.png',
            description: 'Signature noodle dish',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_thai_modern',
        name: 'Ruen Thai Modern',
        rating: 4.4,
        deliveryTime: 30,
        distance: 3.2,
        imagePath: 'assets/images/restaurant (6).png',
        menu: [
          MenuItemModel(
            id: 'ruen_thai_1',
            name: 'Modern Thai Fusion',
            price: 149,
            image: 'assets/images/food-container.png',
            description: 'Contemporary Thai cuisine',
          ),
        ],
      ),
      RestaurantModel(
        id: 'cafe_rim_nam',
        name: 'Cafe Rim Nam',
        rating: 4.3,
        deliveryTime: 20,
        distance: 2.9,
        imagePath: 'assets/images/coffee-shop (1).png',
        menu: [
          MenuItemModel(
            id: 'cafe_rim_1',
            name: 'Riverside Coffee',
            price: 59,
            image: 'assets/images/food-container.png',
            description: 'Refreshing riverside coffee experience',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_suan_som',
        name: 'Ruen Suan Som',
        rating: 4.5,
        deliveryTime: 25,
        distance: 3.1,
        imagePath: 'assets/images/pizzeria.png',
        menu: [
          MenuItemModel(
            id: 'ruen_suan_1',
            name: 'Suan Som Special',
            price: 119,
            image: 'assets/images/food-container.png',
            description: 'Unique dish from Ruen Suan Som',
          ),
        ],
      ),
    ];
  }

  static RestaurantModel? getRestaurantById(String id) {
    try {
      return getPromoRestaurants().firstWhere(
        (restaurant) => restaurant.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
