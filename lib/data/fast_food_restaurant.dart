import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class FastFoodRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/burger (2).png',
    'assets/images/burger (1).png',
    'assets/images/beverage.png',
    'assets/images/pizza.png',
    'assets/images/french-fries.png',
    'assets/images/food.png',
    'assets/images/junk-food.png',
    'assets/images/fast-food (5).png',
    'assets/images/fast-food (4).png',
    'assets/images/fast-food (3).png',
    'assets/images/fast-food (2).png',
    'assets/images/fast-food (1).png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'bangkok_burger_house',
      name: 'Bangkok Burger House',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/fast-food.png',
      menu: [
        MenuItemModel(
          id: 'bangkok_burger_house_1',
          name: 'Tom Yum Burger',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Beef patty infused with tom yum spices, kaffir lime mayo and lemongrass slaw',
        ),
        MenuItemModel(
          id: 'bangkok_burger_house_2',
          name: 'Grapao Burger',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Chicken patty topped with holy basil stir-fry and fried egg',
        ),
        MenuItemModel(
          id: 'bangkok_burger_house_3',
          name: 'Massaman Beef Burger',
          price: 179,
          image: _getRandomImagePath(),
          description:
              'Slow-cooked massaman beef on a brioche bun with peanut sauce and crispy shallots',
        ),
        MenuItemModel(
          id: 'bangkok_burger_house_4',
          name: 'Som Tam Crispy Chicken Burger',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Fried chicken with green papaya slaw and spicy lime dressing',
        ),
        MenuItemModel(
          id: 'bangkok_burger_house_5',
          name: 'Panang Pork Burger',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Pulled pork in rich panang curry sauce with kaffir lime and peanuts',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_pizza_co',
      name: 'Thai Pizza Co.',
      rating: 4.5,
      deliveryTime: 25,
      distance: 2.3,
      imagePath: 'assets/images/pizzeria.png',
      menu: [
        MenuItemModel(
          id: 'thai_pizza_co_1',
          name: 'Tom Yum Goong Pizza',
          price: 259,
          image: _getRandomImagePath(),
          description:
              'Spicy tom yum sauce base with prawns, mushrooms, and kaffir lime leaves',
        ),
        MenuItemModel(
          id: 'thai_pizza_co_2',
          name: 'Green Curry Chicken Pizza',
          price: 229,
          image: _getRandomImagePath(),
          description:
              'Green curry sauce with chicken, eggplant, and sweet basil',
        ),
        MenuItemModel(
          id: 'thai_pizza_co_3',
          name: 'Pad Krapow Pizza',
          price: 219,
          image: _getRandomImagePath(),
          description:
              'Minced pork with holy basil, chili, and topped with a runny egg',
        ),
        MenuItemModel(
          id: 'thai_pizza_co_4',
          name: 'Satay Chicken Pizza',
          price: 219,
          image: _getRandomImagePath(),
          description:
              'Peanut sauce base with grilled satay chicken, capsicum and red onion',
        ),
        MenuItemModel(
          id: 'thai_pizza_co_5',
          name: 'Massaman Lamb Pizza',
          price: 269,
          image: _getRandomImagePath(),
          description:
              'Massaman curry sauce with tender lamb, potato chunks and cashews',
        ),
      ],
    ),
    RestaurantModel(
      id: 'siam_fried_chicken',
      name: 'Siam Fried Chicken',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.4,
      imagePath: 'assets/images/burger.png',
      menu: [
        MenuItemModel(
          id: 'siam_fried_chicken_1',
          name: 'Thai Fried Chicken Bucket (8 pcs)',
          price: 229,
          image: _getRandomImagePath(),
          description:
              'Crispy fried chicken marinated in Thai herbs and spices',
        ),
        MenuItemModel(
          id: 'siam_fried_chicken_2',
          name: 'Sriracha Glazed Wings (6 pcs)',
          price: 159,
          image: _getRandomImagePath(),
          description: 'Crispy wings coated in sweet and spicy sriracha glaze',
        ),
        MenuItemModel(
          id: 'siam_fried_chicken_3',
          name: 'Tom Yum Tenders (5 pcs)',
          price: 139,
          image: _getRandomImagePath(),
          description: 'Chicken tenders dusted with tom yum spice blend',
        ),
        MenuItemModel(
          id: 'siam_fried_chicken_4',
          name: 'Coconut Fried Chicken (4 pcs)',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Chicken coated in coconut flakes and served with sweet chili sauce',
        ),
        MenuItemModel(
          id: 'siam_fried_chicken_5',
          name: 'Lemongrass Chicken & Rice Set',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Fried chicken with lemongrass flavor, served with jasmine rice and som tam',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_taco_fusion',
      name: 'Thai Taco Fusion',
      rating: 4.4,
      deliveryTime: 20,
      distance: 2.5,
      imagePath: 'assets/images/fast-food (5).png',
      menu: [
        MenuItemModel(
          id: 'thai_taco_fusion_1',
          name: 'Pad Thai Taco (3 pcs)',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Soft tortillas filled with pad thai noodles, tofu, bean sprouts and crushed peanuts',
        ),
        MenuItemModel(
          id: 'thai_taco_fusion_2',
          name: 'Green Curry Chicken Wrap',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Flour tortilla filled with green curry chicken, jasmine rice and vegetables',
        ),
        MenuItemModel(
          id: 'thai_taco_fusion_3',
          name: 'Tom Yum Shrimp Taco (3 pcs)',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Corn tortillas with tom yum seasoned shrimp, lime slaw and spicy mayo',
        ),
        MenuItemModel(
          id: 'thai_taco_fusion_4',
          name: 'Massaman Beef Burrito',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Large tortilla wrapped around massaman curry beef, potatoes and rice',
        ),
        MenuItemModel(
          id: 'thai_taco_fusion_5',
          name: 'Larb Gai Lettuce Wraps',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Spicy minced chicken salad served with crisp lettuce leaves for wrapping',
        ),
      ],
    ),
    RestaurantModel(
      id: 'bangkok_hot_dogs',
      name: 'Bangkok Hot Dogs',
      rating: 4.3,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/food-truck.png',
      menu: [
        MenuItemModel(
          id: 'bangkok_hot_dogs_1',
          name: 'Thai Basil Dog',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Hot dog topped with spicy holy basil stir-fry, chili and fried egg',
        ),
        MenuItemModel(
          id: 'bangkok_hot_dogs_2',
          name: 'Tom Yum Dog',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Sausage infused with tom yum spices, topped with lemongrass slaw',
        ),
        MenuItemModel(
          id: 'bangkok_hot_dogs_3',
          name: 'Panang Curry Dog',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Hot dog smothered in rich panang curry sauce with crushed peanuts',
        ),
        MenuItemModel(
          id: 'bangkok_hot_dogs_4',
          name: 'Som Tam Dog',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Hot dog topped with green papaya salad and peanut dressing',
        ),
        MenuItemModel(
          id: 'bangkok_hot_dogs_5',
          name: 'Crying Tiger Dog',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Spicy grilled beef sausage with nam jim jaew dipping sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_crispy_sandwich',
      name: 'Thai Crispy Sandwich',
      rating: 4.5,
      deliveryTime: 20,
      distance: 2.1,
      imagePath: 'assets/images/fast-food.png',
      menu: [
        MenuItemModel(
          id: 'thai_crispy_sandwich_1',
          name: 'Gai Tod Sandwich',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Crispy Thai fried chicken with sriracha mayo and pickled slaw',
        ),
        MenuItemModel(
          id: 'thai_crispy_sandwich_2',
          name: 'Moo Ping Baguette',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Grilled marinated pork skewers with sticky rice spread and jaew sauce',
        ),
        MenuItemModel(
          id: 'thai_crispy_sandwich_3',
          name: 'Tom Yum Tuna Melt',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Spicy tom yum flavored tuna salad with melted cheese on toasted bread',
        ),
        MenuItemModel(
          id: 'thai_crispy_sandwich_4',
          name: 'Satay Chicken Ciabatta',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Grilled chicken with peanut sauce, cucumber relish on ciabatta bread',
        ),
        MenuItemModel(
          id: 'thai_crispy_sandwich_5',
          name: 'Massaman Beef Sub',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Slow-cooked massaman beef with potatoes and peanuts in a sub roll',
        ),
      ],
    ),
    RestaurantModel(
      id: 'flash_fry_thai',
      name: 'Flash Fry Thai',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.9,
      imagePath: 'assets/images/burger.png',
      menu: [
        MenuItemModel(
          id: 'flash_fry_thai_1',
          name: 'Pad Krapow Box',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Quick-fried minced meat with holy basil over rice with fried egg',
        ),
        MenuItemModel(
          id: 'flash_fry_thai_2',
          name: 'Pad Prik Gang Fast Box',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Stir-fried meat with red curry paste and string beans over rice',
        ),
        MenuItemModel(
          id: 'flash_fry_thai_3',
          name: 'Garlic Pepper Express',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Stir-fried meat with garlic and pepper sauce served with quickie rice',
        ),
        MenuItemModel(
          id: 'flash_fry_thai_4',
          name: 'Sweet & Sour Flash Fry',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Crispy protein with sweet and sour sauce, pineapple and bell peppers',
        ),
        MenuItemModel(
          id: 'flash_fry_thai_5',
          name: 'Cashew Stir-Fry Dash',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Quick stir-fry with cashew nuts, dried chili and crispy protein over rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'royal_thai_nuggets',
      name: 'Royal Thai Nuggets',
      rating: 4.3,
      deliveryTime: 15,
      distance: 1.6,
      imagePath: 'assets/images/fast-food (5).png',
      menu: [
        MenuItemModel(
          id: 'royal_thai_nuggets_1',
          name: 'Thai Herb Nuggets (8 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Chicken nuggets infused with Thai herbs and spices',
        ),
        MenuItemModel(
          id: 'royal_thai_nuggets_2',
          name: 'Tom Yum Fries',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Crispy fries seasoned with tom yum spice blend',
        ),
        MenuItemModel(
          id: 'royal_thai_nuggets_3',
          name: 'Satay Nugget Box',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Nuggets with peanut dipping sauce, served with fries and drink',
        ),
        MenuItemModel(
          id: 'royal_thai_nuggets_4',
          name: 'Thai BBQ Popcorn Chicken',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Small bite-sized pieces of fried chicken with Thai BBQ seasoning',
        ),
        MenuItemModel(
          id: 'royal_thai_nuggets_5',
          name: 'Green Curry Dippers & Fries',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Chicken dippers with green curry sauce for dipping and crispy fries',
        ),
      ],
    ),
    RestaurantModel(
      id: 'spicy_thai_wings',
      name: 'Spicy Thai Wings',
      rating: 4.7,
      deliveryTime: 20,
      distance: 2.2,
      imagePath: 'assets/images/food-truck.png',
      menu: [
        MenuItemModel(
          id: 'spicy_thai_wings_1',
          name: 'Nam Jim Jaew Wings (6 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Crispy wings glazed with spicy Isaan-style dipping sauce',
        ),
        MenuItemModel(
          id: 'spicy_thai_wings_2',
          name: 'Tom Yum Wings (6 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Wings coated in spicy and sour tom yum sauce with kaffir lime',
        ),
        MenuItemModel(
          id: 'spicy_thai_wings_3',
          name: 'Garlic Pepper Wings (6 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Wings tossed in garlic pepper sauce with crispy garlic bits',
        ),
        MenuItemModel(
          id: 'spicy_thai_wings_4',
          name: 'Sweet Chili Wings (6 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Wings glazed in Thai sweet chili sauce with sesame seeds',
        ),
        MenuItemModel(
          id: 'spicy_thai_wings_5',
          name: 'Wing Sampler Platter (12 pcs)',
          price: 249,
          image: _getRandomImagePath(),
          description:
              'Mix of three wing flavors of your choice with dipping sauces',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_fusion_bowls',
      name: 'Thai Fusion Bowls',
      rating: 4.5,
      deliveryTime: 15,
      distance: 2.0,
      imagePath: 'assets/images/fast-food.png',
      menu: [
        MenuItemModel(
          id: 'thai_fusion_bowls_1',
          name: 'Grapao Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rice bowl with spicy minced meat, holy basil and fried egg',
        ),
        MenuItemModel(
          id: 'thai_fusion_bowls_2',
          name: 'Green Curry Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Jasmine rice with green curry, chicken, eggplant and sweet basil',
        ),
        MenuItemModel(
          id: 'thai_fusion_bowls_3',
          name: 'Pad Thai Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Pad Thai noodles with egg, tofu, bean sprouts in a convenient bowl format',
        ),
        MenuItemModel(
          id: 'thai_fusion_bowls_4',
          name: 'Tom Yum Noodle Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Rice noodles in spicy tom yum broth with prawns and mushrooms',
        ),
        MenuItemModel(
          id: 'thai_fusion_bowls_5',
          name: 'Massaman Curry Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Rice with creamy massaman curry, tender meat, potatoes and peanuts',
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
