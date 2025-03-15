import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class DefaultRestaurantData {
  static List<RestaurantModel> getDefaultRestaurants() {
    return [
      RestaurantModel(
        id: 'ruen_kruang_kaeng',
        name: 'Ruen Kruang Kaeng',
        rating: 4.6,
        deliveryTime: 30,
        distance: 3.3,
        imagePath: 'assets/images/pizzeria.png',
        menu: [
          MenuItemModel(
            id: 'ruen_kruang_1',
            name: 'Signature Pizza',
            price: 199,
            image: 'assets/images/food-container (1).png',
            description: 'House specialty pizza with local ingredients',
          ),
        ],
      ),
      RestaurantModel(
        id: 'cha_yen_rim_klong',
        name: 'Cha Yen Rim Klong',
        rating: 4.2,
        deliveryTime: 15,
        distance: 2.0,
        imagePath: 'assets/images/coffee-shop (1).png',
        menu: [
          MenuItemModel(
            id: 'cha_yen_1',
            name: 'Thai Iced Tea',
            price: 49,
            image: 'assets/images/food-container (1).png',
            description: 'Classic Thai refreshing iced tea',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_isaan_modern',
        name: 'Ruen Isaan Modern',
        rating: 4.7,
        deliveryTime: 35,
        distance: 3.4,
        imagePath: 'assets/images/restaurant (6).png',
        menu: [
          MenuItemModel(
            id: 'ruen_isaan_1',
            name: 'Isaan Spicy Salad',
            price: 129,
            image: 'assets/images/food-container (1).png',
            description: 'Authentic Isaan-style spicy salad',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ba_mee_hang_rim_klong',
        name: 'Ba Mee Hang Rim Klong',
        rating: 4.5,
        deliveryTime: 20,
        distance: 2.4,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'ba_mee_1',
            name: 'Noodle Special',
            price: 89,
            image: 'assets/images/food-container (1).png',
            description: 'Delicious traditional noodle dish',
          ),
        ],
      ),
      RestaurantModel(
        id: 'khanom_krok_baan_suan',
        name: 'Khanom Krok Baan Suan',
        rating: 4.6,
        deliveryTime: 25,
        distance: 2.8,
        imagePath: 'assets/images/restaurant (4).png',
        menu: [
          MenuItemModel(
            id: 'khanom_krok_1',
            name: 'Coconut Pancakes',
            price: 59,
            image: 'assets/images/food-container (1).png',
            description: 'Traditional Thai coconut pancakes',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_khao_mok_halal',
        name: 'Ruen Khao Mok Halal',
        rating: 4.7,
        deliveryTime: 30,
        distance: 3.6,
        imagePath: 'assets/images/restaurant (3).png',
        menu: [
          MenuItemModel(
            id: 'ruen_khao_1',
            name: 'Halal Biryani',
            price: 159,
            image: 'assets/images/food-container (1).png',
            description: 'Authentic Halal biryani rice dish',
          ),
        ],
      ),
      RestaurantModel(
        id: 'moo_ping_rim_thang',
        name: 'Moo Ping Rim Thang',
        rating: 4.5,
        deliveryTime: 15,
        distance: 2.6,
        imagePath: 'assets/images/restaurant (2).png',
        menu: [
          MenuItemModel(
            id: 'moo_ping_1',
            name: 'Grilled Pork Skewers',
            price: 79,
            image: 'assets/images/food-container (1).png',
            description: 'Traditional Thai grilled pork skewers',
          ),
        ],
      ),
      RestaurantModel(
        id: 'burger_isaan_fusion',
        name: 'Burger Isaan Fusion',
        rating: 4.4,
        deliveryTime: 25,
        distance: 3.0,
        imagePath: 'assets/images/burger-bar.png',
        menu: [
          MenuItemModel(
            id: 'burger_fusion_1',
            name: 'Isaan Fusion Burger',
            price: 149,
            image: 'assets/images/food-container (1).png',
            description: 'Unique burger with Isaan-inspired flavors',
          ),
        ],
      ),
      RestaurantModel(
        id: 'jae_delivery_rim_klong',
        name: 'Jae Delivery Rim Klong',
        rating: 4.6,
        deliveryTime: 20,
        distance: 2.8,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'jae_delivery_1',
            name: 'Signature Delivery Dish',
            price: 109,
            image: 'assets/images/food-container (1).png',
            description: 'Special dish from Jae Delivery',
          ),
        ],
      ),
      RestaurantModel(
        id: 'cafe_ya_dong_rim_klong',
        name: 'Cafe Ya Dong Rim Klong',
        rating: 4.3,
        deliveryTime: 20,
        distance: 2.9,
        imagePath: 'assets/images/coffee-shop.png',
        menu: [
          MenuItemModel(
            id: 'cafe_ya_dong_1',
            name: 'Local Coffee Special',
            price: 59,
            image: 'assets/images/food-container (1).png',
            description: 'Unique local coffee blend',
          ),
        ],
      ),
      RestaurantModel(
        id: 'ruen_khanom_jeen_nam_ya',
        name: 'Ruen Khanom Jeen Nam Ya',
        rating: 4.6,
        deliveryTime: 25,
        distance: 3.2,
        imagePath: 'assets/images/restaurant.png',
        menu: [
          MenuItemModel(
            id: 'ruen_khanom_1',
            name: 'Khanom Jeen Nam Ya',
            price: 89,
            image: 'assets/images/food-container (1).png',
            description: 'Traditional Thai noodle dish with curry sauce',
          ),
        ],
      ),
      RestaurantModel(
        id: 'kai_yang_burger',
        name: 'Kai Yang Burger',
        rating: 4.2,
        deliveryTime: 15,
        distance: 2.7,
        imagePath: 'assets/images/fast-food.png',
        menu: [
          MenuItemModel(
            id: 'kai_yang_1',
            name: 'Grilled Chicken Burger',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description: 'Delicious grilled chicken burger',
          ),
        ],
      ),
    ];
  }

  static RestaurantModel? getRestaurantById(String id) {
    try {
      return getDefaultRestaurants().firstWhere(
        (restaurant) => restaurant.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
