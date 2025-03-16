import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class RiceBowlsRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/fried-rice.png',
    'assets/images/rice.png',
    'assets/images/curry-rice.png',
    'assets/images/rice (1).png',
    'assets/images/rice-bowl.png',
    'assets/images/rice-bowl (1).png',
    'assets/images/fried-rice (1).png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'khao_heaven',
      name: 'Khao Heaven',
      rating: 4.7,
      deliveryTime: 25,
      distance: 2.3,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'khao_heaven_1',
          name: 'Khao Man Gai Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Aromatic rice with poached chicken, served with special ginger sauce',
        ),
        MenuItemModel(
          id: 'khao_heaven_2',
          name: 'Khao Kha Moo Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Fragrant rice topped with slow-braised pork leg and pickled vegetables',
        ),
        MenuItemModel(
          id: 'khao_heaven_3',
          name: 'Khao Moo Daeng Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Jasmine rice with Thai red BBQ pork and sweet gravy',
        ),
        MenuItemModel(
          id: 'khao_heaven_4',
          name: 'Khao Moo Grob Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Rice bowl with crispy pork belly and sweet chili sauce',
        ),
        MenuItemModel(
          id: 'khao_heaven_5',
          name: 'Khao Kai Tod Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice topped with Thai-style fried chicken and sriracha sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'fried_rice_paradise',
      name: 'Fried Rice Paradise',
      rating: 4.5,
      deliveryTime: 20,
      distance: 1.8,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'fried_rice_paradise_1',
          name: 'Khao Pad Gai Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Classic Thai fried rice with chicken and egg',
        ),
        MenuItemModel(
          id: 'fried_rice_paradise_2',
          name: 'Khao Pad Goong Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Shrimp fried rice with fresh prawns and vegetables',
        ),
        MenuItemModel(
          id: 'fried_rice_paradise_3',
          name: 'Khao Pad Sapparod Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Pineapple fried rice with cashews and raisins',
        ),
        MenuItemModel(
          id: 'fried_rice_paradise_4',
          name: 'Khao Pad Nam Prik Pao Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Fried rice with Thai chili jam and your choice of protein',
        ),
        MenuItemModel(
          id: 'fried_rice_paradise_5',
          name: 'Khao Pad Krapow Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Spicy holy basil fried rice with fried egg on top',
        ),
      ],
    ),
    RestaurantModel(
      id: 'curry_on_rice',
      name: 'Curry On Rice',
      rating: 4.8,
      deliveryTime: 30,
      distance: 2.5,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'curry_on_rice_1',
          name: 'Green Curry Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fragrant rice with green curry, chicken, eggplant and Thai basil',
        ),
        MenuItemModel(
          id: 'curry_on_rice_2',
          name: 'Panang Curry Rice Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Rice with thick panang curry, beef and kaffir lime leaves',
        ),
        MenuItemModel(
          id: 'curry_on_rice_3',
          name: 'Massaman Curry Rice Bowl',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Rice topped with rich massaman curry, chicken and potatoes',
        ),
        MenuItemModel(
          id: 'curry_on_rice_4',
          name: 'Yellow Curry Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Rice with turmeric curry, vegetables and your choice of protein',
        ),
        MenuItemModel(
          id: 'curry_on_rice_5',
          name: 'Jungle Curry Rice Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Spicy water-based curry with wild herbs and pork on rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'stir_fry_rice_house',
      name: 'Stir-Fry Rice House',
      rating: 4.6,
      deliveryTime: 25,
      distance: 2.2,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'stir_fry_rice_house_1',
          name: 'Pad Grapao Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Rice topped with stir-fried holy basil, minced pork and fried egg',
        ),
        MenuItemModel(
          id: 'stir_fry_rice_house_2',
          name: 'Pad Prik Gaeng Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice with stir-fried red curry paste, long beans and chicken',
        ),
        MenuItemModel(
          id: 'stir_fry_rice_house_3',
          name: 'Pad Phet Rice Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Rice with spicy stir-fried pork, wild ginger and green peppercorns',
        ),
        MenuItemModel(
          id: 'stir_fry_rice_house_4',
          name: 'Pad Khing Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice with ginger stir-fry, mushrooms and your choice of protein',
        ),
        MenuItemModel(
          id: 'stir_fry_rice_house_5',
          name: 'Pad Prik Sod Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Rice topped with fresh chili stir-fry with chicken and onions',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_seafood_rice',
      name: 'Thai Seafood Rice',
      rating: 4.7,
      deliveryTime: 35,
      distance: 3.1,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'thai_seafood_rice_1',
          name: 'Shrimp Pad Cha Rice Bowl',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Rice with spicy stir-fried prawns with Thai herbs and wild ginger',
        ),
        MenuItemModel(
          id: 'thai_seafood_rice_2',
          name: 'Crab Meat Fried Rice Bowl',
          price: 179,
          image: _getRandomImagePath(),
          description: 'Premium fried rice with fresh crab meat and egg',
        ),
        MenuItemModel(
          id: 'thai_seafood_rice_3',
          name: 'Squid Basil Rice Bowl',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Rice topped with stir-fried squid, holy basil and chili',
        ),
        MenuItemModel(
          id: 'thai_seafood_rice_4',
          name: 'Mixed Seafood Rice Bowl',
          price: 169,
          image: _getRandomImagePath(),
          description: 'Rice with assorted seafood in spicy lime sauce',
        ),
        MenuItemModel(
          id: 'thai_seafood_rice_5',
          name: 'Fish Fillet Rice Bowl',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Rice with crispy fish fillet topped with sweet and sour sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'isaan_rice_corner',
      name: 'Isaan Rice Corner',
      rating: 4.6,
      deliveryTime: 25,
      distance: 2.3,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'isaan_rice_corner_1',
          name: 'Som Tam Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Rice with spicy papaya salad and grilled chicken',
        ),
        MenuItemModel(
          id: 'isaan_rice_corner_2',
          name: 'Laab Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice topped with spicy minced pork salad with roasted rice powder',
        ),
        MenuItemModel(
          id: 'isaan_rice_corner_3',
          name: 'Nam Tok Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Rice with spicy grilled beef salad and lime dressing',
        ),
        MenuItemModel(
          id: 'isaan_rice_corner_4',
          name: 'Kai Yang Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice with Isaan-style marinated grilled chicken and tamarind sauce',
        ),
        MenuItemModel(
          id: 'isaan_rice_corner_5',
          name: 'Moo Ping Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Rice with grilled marinated pork skewers and sticky rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'vegan_rice_garden',
      name: 'Vegan Rice Garden',
      rating: 4.5,
      deliveryTime: 20,
      distance: 1.9,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'vegan_rice_garden_1',
          name: 'Tofu Basil Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Rice with spicy stir-fried tofu, holy basil and vegetables',
        ),
        MenuItemModel(
          id: 'vegan_rice_garden_2',
          name: 'Vegetable Green Curry Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice with vegan green curry, eggplant and mixed vegetables',
        ),
        MenuItemModel(
          id: 'vegan_rice_garden_3',
          name: 'Mushroom Pad Khing Rice Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Rice topped with ginger stir-fried mixed mushrooms',
        ),
        MenuItemModel(
          id: 'vegan_rice_garden_4',
          name: 'Vegetable Fried Rice Bowl',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Vegan fried rice with tofu and seasonal vegetables',
        ),
        MenuItemModel(
          id: 'vegan_rice_garden_5',
          name: 'Pineapple Curry Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Rice with sweet and spicy pineapple curry with tofu',
        ),
      ],
    ),
    RestaurantModel(
      id: 'fusion_rice_lab',
      name: 'Fusion Rice Lab',
      rating: 4.4,
      deliveryTime: 30,
      distance: 2.7,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'fusion_rice_lab_1',
          name: 'Tom Yum Fried Rice Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Rice stir-fried with tom yum paste, seafood and kaffir lime leaves',
        ),
        MenuItemModel(
          id: 'fusion_rice_lab_2',
          name: 'Green Curry Risotto Bowl',
          price: 149,
          image: _getRandomImagePath(),
          description: 'Italian risotto cooked with Thai green curry flavors',
        ),
        MenuItemModel(
          id: 'fusion_rice_lab_3',
          name: 'Masala Rice Bowl',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Thai jasmine rice with Indian-inspired chicken masala curry',
        ),
        MenuItemModel(
          id: 'fusion_rice_lab_4',
          name: 'Kimchi Fried Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Thai-Korean fusion fried rice with kimchi and Thai herbs',
        ),
        MenuItemModel(
          id: 'fusion_rice_lab_5',
          name: 'Japanese Curry Rice Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Thai jasmine rice with Japanese-style curry and Thai spices',
        ),
      ],
    ),
    RestaurantModel(
      id: 'royal_thai_rice',
      name: 'Royal Thai Rice',
      rating: 4.8,
      deliveryTime: 40,
      distance: 3.5,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'royal_thai_rice_1',
          name: 'Khao Chae Royal Rice Bowl',
          price: 199,
          image: _getRandomImagePath(),
          description:
              'Traditional royal Thai jasmine rice soaked in flower-scented water with assorted side dishes',
        ),
        MenuItemModel(
          id: 'royal_thai_rice_2',
          name: 'Crab Roe Fried Rice Bowl',
          price: 249,
          image: _getRandomImagePath(),
          description:
              'Premium fried rice with crab meat and roe in royal Thai style',
        ),
        MenuItemModel(
          id: 'royal_thai_rice_3',
          name: 'Pineapple Duck Curry Rice Bowl',
          price: 219,
          image: _getRandomImagePath(),
          description:
              'Rice with royal recipe duck curry with pineapple and grapes',
        ),
        MenuItemModel(
          id: 'royal_thai_rice_4',
          name: 'Prawns in Flower Rice Bowl',
          price: 239,
          image: _getRandomImagePath(),
          description:
              'Rice with large prawns in traditional flower-shaped presentation',
        ),
        MenuItemModel(
          id: 'royal_thai_rice_5',
          name: 'Royal Thai Yellow Rice Bowl',
          price: 179,
          image: _getRandomImagePath(),
          description:
              'Aromatic turmeric rice with royal Thai-style side dishes',
        ),
      ],
    ),
    RestaurantModel(
      id: 'khao_tom_special',
      name: 'Khao Tom Special',
      rating: 4.3,
      deliveryTime: 15,
      distance: 1.5,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'khao_tom_special_1',
          name: 'Khao Tom Moo Bowl',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Traditional Thai rice soup with pork and herbs',
        ),
        MenuItemModel(
          id: 'khao_tom_special_2',
          name: 'Khao Tom Gai Bowl',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Rice soup with chicken, ginger and Thai herbs',
        ),
        MenuItemModel(
          id: 'khao_tom_special_3',
          name: 'Khao Tom Talay Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Rice soup with mixed seafood and lemongrass',
        ),
        MenuItemModel(
          id: 'khao_tom_special_4',
          name: 'Khao Tom Pla Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Rice soup with fish fillets, ginger and preserved vegetables',
        ),
        MenuItemModel(
          id: 'khao_tom_special_5',
          name: 'Khao Tom Khai Jiew Bowl',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Simple rice soup served with Thai omelet on the side',
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
