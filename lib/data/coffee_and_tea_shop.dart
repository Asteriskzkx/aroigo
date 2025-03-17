import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class CoffeeAndTeaShop {
  static final List<String> _imagePaths = [
    'assets/images/coffee-cup.png',
    'assets/images/iced-coffee.png',
    'assets/images/coffee.png',
    'assets/images/coffee (1).png',
    'assets/images/ice-coffee.png',
    'assets/images/green-tea.png',
    'assets/images/green-tea (1).png',
    'assets/images/tea-time.png',
    'assets/images/coffee-cup (1).png',
    'assets/images/tea-cup.png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'cha_yen_classic',
      name: 'Cha Yen Classic',
      rating: 4.8,
      deliveryTime: 15,
      distance: 1.5,
      imagePath: 'assets/images/coffee-shop (1).png',
      menu: [
        MenuItemModel(
          id: 'cha_yen_classic_1',
          name: 'Thai Iced Tea Original',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Classic Thai tea with condensed milk and crushed ice',
        ),
        MenuItemModel(
          id: 'cha_yen_classic_2',
          name: 'Thai Milk Coffee',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Traditional Thai coffee with condensed milk',
        ),
        MenuItemModel(
          id: 'cha_yen_classic_3',
          name: 'Cha Dum Yen',
          price: 55,
          image: _getRandomImagePath(),
          description: 'Strong black iced Thai tea with sugar syrup',
        ),
        MenuItemModel(
          id: 'cha_yen_classic_4',
          name: 'Cha Manao',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Thai iced tea with fresh lime juice',
        ),
        MenuItemModel(
          id: 'cha_yen_classic_5',
          name: 'Kafae Boran',
          price: 69,
          image: _getRandomImagePath(),
          description:
              'Traditional Thai-style filtered coffee with a strong aroma',
        ),
      ],
    ),
    RestaurantModel(
      id: 'boba_thai_cafe',
      name: 'Boba Thai Cafe',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.2,
      imagePath: 'assets/images/coffee-shop.png',
      menu: [
        MenuItemModel(
          id: 'boba_thai_cafe_1',
          name: 'Thai Milk Tea Boba',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Thai tea with milk and chewy tapioca pearls',
        ),
        MenuItemModel(
          id: 'boba_thai_cafe_2',
          name: 'Matcha Boba',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Japanese matcha with milk and tapioca pearls',
        ),
        MenuItemModel(
          id: 'boba_thai_cafe_3',
          name: 'Thai Coffee Boba',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Strong Thai coffee with milk and tapioca pearls',
        ),
        MenuItemModel(
          id: 'boba_thai_cafe_4',
          name: 'Coconut Milk Tea Boba',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Thai tea with coconut milk and tapioca pearls',
        ),
        MenuItemModel(
          id: 'boba_thai_cafe_5',
          name: 'Brown Sugar Milk Boba',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Fresh milk with brown sugar syrup and tapioca pearls',
        ),
      ],
    ),
    RestaurantModel(
      id: 'specialty_roast_siam',
      name: 'Specialty Roast Siam',
      rating: 4.9,
      deliveryTime: 25,
      distance: 2.8,
      imagePath: 'assets/images/coffee-shop.png',
      menu: [
        MenuItemModel(
          id: 'specialty_roast_siam_1',
          name: 'Doi Chang Drip Coffee',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Single-origin coffee from northern Thailand mountains',
        ),
        MenuItemModel(
          id: 'specialty_roast_siam_2',
          name: 'Espresso Shot',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Rich and concentrated espresso using Thai coffee beans',
        ),
        MenuItemModel(
          id: 'specialty_roast_siam_3',
          name: 'Thai Latte',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Espresso with steamed milk and subtle Thai spices',
        ),
        MenuItemModel(
          id: 'specialty_roast_siam_4',
          name: 'Iced Americano',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Chilled espresso with water and ice cubes',
        ),
        MenuItemModel(
          id: 'specialty_roast_siam_5',
          name: 'Cold Brew',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Smooth cold-brewed coffee steeped for 12 hours',
        ),
      ],
    ),
    RestaurantModel(
      id: 'butterfly_pea_haven',
      name: 'Butterfly Pea Haven',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.9,
      imagePath: 'assets/images/coffee-shop (1).png',
      menu: [
        MenuItemModel(
          id: 'butterfly_pea_haven_1',
          name: 'Butterfly Pea Milk Tea',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Blue butterfly pea flower tea with milk and honey',
        ),
        MenuItemModel(
          id: 'butterfly_pea_haven_2',
          name: 'Lemon Butterfly Pea',
          price: 69,
          image: _getRandomImagePath(),
          description:
              'Color-changing butterfly pea tea with fresh lemon juice',
        ),
        MenuItemModel(
          id: 'butterfly_pea_haven_3',
          name: 'Butterfly Pea Latte',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Butterfly pea flower tea with frothed milk',
        ),
        MenuItemModel(
          id: 'butterfly_pea_haven_4',
          name: 'Butterfly Pea Honey',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Butterfly pea flower tea sweetened with longan honey',
        ),
        MenuItemModel(
          id: 'butterfly_pea_haven_5',
          name: 'Butterfly Pea Soda',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Refreshing butterfly pea tea with soda water and lime',
        ),
      ],
    ),
    RestaurantModel(
      id: 'herbal_brew_bangkok',
      name: 'Herbal Brew Bangkok',
      rating: 4.5,
      deliveryTime: 20,
      distance: 2.4,
      imagePath: 'assets/images/coffee-shop.png',
      menu: [
        MenuItemModel(
          id: 'herbal_brew_bangkok_1',
          name: 'Lemongrass Iced Tea',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Refreshing lemongrass infusion with honey',
        ),
        MenuItemModel(
          id: 'herbal_brew_bangkok_2',
          name: 'Pandanus Leaf Tea',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Aromatic green tea made from pandanus leaves',
        ),
        MenuItemModel(
          id: 'herbal_brew_bangkok_3',
          name: 'Ginger Honey Tea',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Warming ginger tea with Thai honey and lime',
        ),
        MenuItemModel(
          id: 'herbal_brew_bangkok_4',
          name: 'Bael Fruit Tea',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Traditional Thai medicinal tea from dried bael fruit',
        ),
        MenuItemModel(
          id: 'herbal_brew_bangkok_5',
          name: 'Chrysanthemum Tea',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Soothing floral tea with cooling properties',
        ),
      ],
    ),
    RestaurantModel(
      id: 'matcha_thai_fusion',
      name: 'Matcha Thai Fusion',
      rating: 4.6,
      deliveryTime: 25,
      distance: 2.7,
      imagePath: 'assets/images/coffee-shop (1).png',
      menu: [
        MenuItemModel(
          id: 'matcha_thai_fusion_1',
          name: 'Thai Matcha Latte',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Premium matcha with steamed milk and Thai pandan essence',
        ),
        MenuItemModel(
          id: 'matcha_thai_fusion_2',
          name: 'Coconut Matcha',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Matcha green tea with coconut milk and coconut shavings',
        ),
        MenuItemModel(
          id: 'matcha_thai_fusion_3',
          name: 'Thai Iced Matcha',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Iced matcha with condensed milk in Thai style',
        ),
        MenuItemModel(
          id: 'matcha_thai_fusion_4',
          name: 'Matcha Brown Sugar Boba',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Matcha milk tea with brown sugar tapioca pearls',
        ),
        MenuItemModel(
          id: 'matcha_thai_fusion_5',
          name: 'Matcha Yuzu',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Refreshing matcha with yuzu citrus and honey',
        ),
      ],
    ),
    RestaurantModel(
      id: 'coffee_dessert_junction',
      name: 'Coffee & Dessert Junction',
      rating: 4.7,
      deliveryTime: 30,
      distance: 2.5,
      imagePath: 'assets/images/coffee-shop.png',
      menu: [
        MenuItemModel(
          id: 'coffee_dessert_junction_1',
          name: 'Affogato Thai Style',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Thai tea ice cream with a shot of hot espresso',
        ),
        MenuItemModel(
          id: 'coffee_dessert_junction_2',
          name: 'Khanom Chan Latte',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Pandan-flavored latte inspired by layered Thai dessert',
        ),
        MenuItemModel(
          id: 'coffee_dessert_junction_3',
          name: 'Thai Coffee Float',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Thai iced coffee topped with vanilla ice cream',
        ),
        MenuItemModel(
          id: 'coffee_dessert_junction_4',
          name: 'Mango Sticky Rice Smoothie',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Mango smoothie with coconut milk and sticky rice inspired flavors',
        ),
        MenuItemModel(
          id: 'coffee_dessert_junction_5',
          name: 'Coconut Espresso Shake',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Blended coconut milk with Thai espresso and coconut bits',
        ),
      ],
    ),
    RestaurantModel(
      id: 'rustic_thai_cafe',
      name: 'Rustic Thai Cafe',
      rating: 4.4,
      deliveryTime: 20,
      distance: 1.8,
      imagePath: 'assets/images/coffee-shop (1).png',
      menu: [
        MenuItemModel(
          id: 'rustic_thai_cafe_1',
          name: 'Oliang Original',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Traditional Thai black iced coffee with various spices',
        ),
        MenuItemModel(
          id: 'rustic_thai_cafe_2',
          name: 'Ya Dong Espresso',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Espresso infused with Thai herbal liquor flavors (non-alcoholic)',
        ),
        MenuItemModel(
          id: 'rustic_thai_cafe_3',
          name: 'Nam Anchan',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Simple butterfly pea flower tea served hot or cold',
        ),
        MenuItemModel(
          id: 'rustic_thai_cafe_4',
          name: 'Thai Hot Chocolate',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Hot chocolate with Thai spices and coconut milk',
        ),
        MenuItemModel(
          id: 'rustic_thai_cafe_5',
          name: 'Nom Yen',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Traditional Thai pink milk with sala flavor',
        ),
      ],
    ),
    RestaurantModel(
      id: 'fruit_tea_oasis',
      name: 'Fruit Tea Oasis',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/coffee-shop.png',
      menu: [
        MenuItemModel(
          id: 'fruit_tea_oasis_1',
          name: 'Lychee Black Tea',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Aromatic black tea with fresh lychee and lychee jelly',
        ),
        MenuItemModel(
          id: 'fruit_tea_oasis_2',
          name: 'Passion Fruit Green Tea',
          price: 75,
          image: _getRandomImagePath(),
          description:
              'Green tea with vibrant passion fruit and aloe vera bits',
        ),
        MenuItemModel(
          id: 'fruit_tea_oasis_3',
          name: 'Mango Tea',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Black tea with fresh Thai mango and mango jelly',
        ),
        MenuItemModel(
          id: 'fruit_tea_oasis_4',
          name: 'Pomelo Tea',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Refreshing tea with fresh pomelo segments and honey',
        ),
        MenuItemModel(
          id: 'fruit_tea_oasis_5',
          name: 'Watermelon Tea',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Light tea infused with fresh watermelon juice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'milk_tea_factory',
      name: 'Milk Tea Factory',
      rating: 4.3,
      deliveryTime: 20,
      distance: 2.0,
      imagePath: 'assets/images/coffee-shop (1).png',
      menu: [
        MenuItemModel(
          id: 'milk_tea_factory_1',
          name: 'Classic Milk Tea',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Traditional black tea with creamy milk and brown sugar',
        ),
        MenuItemModel(
          id: 'milk_tea_factory_2',
          name: 'Earl Grey Milk Tea',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Fragrant Earl Grey tea with milk and tapioca pearls',
        ),
        MenuItemModel(
          id: 'milk_tea_factory_3',
          name: 'Taro Milk Tea',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Creamy milk tea with sweet taro flavor and pudding',
        ),
        MenuItemModel(
          id: 'milk_tea_factory_4',
          name: 'Thai Milk Tea Extra',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Premium Thai tea with extra creamy milk and boba',
        ),
        MenuItemModel(
          id: 'milk_tea_factory_5',
          name: 'Brown Sugar Pearl Milk',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Fresh milk with brown sugar syrup and pearls',
        ),
      ],
    ),
  ];

  static List<RestaurantModel> getRestaurants() {
    return _restaurants;
  }

  static RestaurantModel? getRestaurantById(String id) {
    try {
      return _restaurants.firstWhere((restaurant) => restaurant.id == id);
    } catch (e) {
      return null;
    }
  }
}
