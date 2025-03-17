import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class SmallBitesSnacksShop {
  static final List<String> _imagePaths = [
    'assets/images/snack.png',
    'assets/images/snack (1).png',
    'assets/images/snack (2).png',
    'assets/images/snack (3).png',
    'assets/images/snack (4).png',
    'assets/images/chocolate-bar.png',
    'assets/images/bread.png',
    'assets/images/chocolate-bar (1).png',
    'assets/images/chocolate.png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'street_snack_heaven',
      name: 'Street Snack Heaven',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.5,
      imagePath: 'assets/images/food-stand (2).png',
      menu: [
        MenuItemModel(
          id: 'street_snack_heaven_1',
          name: 'Moo Ping (4 pcs)',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Grilled marinated pork skewers with sticky rice',
        ),
        MenuItemModel(
          id: 'street_snack_heaven_2',
          name: 'Som Tam Thai',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Spicy green papaya salad with peanuts and dried shrimp',
        ),
        MenuItemModel(
          id: 'street_snack_heaven_3',
          name: 'Pho Pia Tod (5 pcs)',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Crispy spring rolls with glass noodles and vegetables',
        ),
        MenuItemModel(
          id: 'street_snack_heaven_4',
          name: 'Sai Krok Isan (4 pcs)',
          price: 75,
          image: _getRandomImagePath(),
          description:
              'Fermented Northeastern Thai sausage with chili and cabbage',
        ),
        MenuItemModel(
          id: 'street_snack_heaven_5',
          name: 'Kanom Gui Chai (5 pcs)',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Steamed chive dumplings with spicy soy dipping sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'crispy_corner',
      name: 'Crispy Corner',
      rating: 4.5,
      deliveryTime: 20,
      distance: 1.8,
      imagePath: 'assets/images/food-stand (1).png',
      menu: [
        MenuItemModel(
          id: 'crispy_corner_1',
          name: 'Gai Tod (5 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Thai-style fried chicken with crispy garlic and sweet chili sauce',
        ),
        MenuItemModel(
          id: 'crispy_corner_2',
          name: 'Pla Muk Tod',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Crispy fried calamari with sriracha mayo dip',
        ),
        MenuItemModel(
          id: 'crispy_corner_3',
          name: 'Kluay Tod',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Crispy fried banana fritters with honey drizzle',
        ),
        MenuItemModel(
          id: 'crispy_corner_4',
          name: 'Tod Mun Pla (4 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Thai fish cakes with sweet cucumber relish',
        ),
        MenuItemModel(
          id: 'crispy_corner_5',
          name: 'Hoy Tod',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Crispy mussel or oyster omelet with bean sprouts',
        ),
      ],
    ),
    RestaurantModel(
      id: 'khanom_thai_delight',
      name: 'Khanom Thai Delight',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.6,
      imagePath: 'assets/images/food-donation.png',
      menu: [
        MenuItemModel(
          id: 'khanom_thai_delight_1',
          name: 'Khanom Krok (6 pcs)',
          price: 65,
          image: _getRandomImagePath(),
          description:
              'Coconut rice pancakes with corn, taro or pandan flavors',
        ),
        MenuItemModel(
          id: 'khanom_thai_delight_2',
          name: 'Khanom Buang (4 pcs)',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Crispy Thai crepes with sweet or savory fillings',
        ),
        MenuItemModel(
          id: 'khanom_thai_delight_3',
          name: 'Khao Niao Sangkhaya',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Sweet sticky rice with Thai custard',
        ),
        MenuItemModel(
          id: 'khanom_thai_delight_4',
          name: 'Khanom Bua Loy',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Rice flour dumplings in sweet coconut milk',
        ),
        MenuItemModel(
          id: 'khanom_thai_delight_5',
          name: 'Tub Tim Grob',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Red water chestnuts in coconut milk and crushed ice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'dim_sum_thai_style',
      name: 'Dim Sum Thai Style',
      rating: 4.4,
      deliveryTime: 25,
      distance: 2.3,
      imagePath: 'assets/images/food-stand.png',
      menu: [
        MenuItemModel(
          id: 'dim_sum_thai_style_1',
          name: 'Kanom Jeeb (5 pcs)',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Steamed pork and shrimp dumplings with garlic oil',
        ),
        MenuItemModel(
          id: 'dim_sum_thai_style_2',
          name: 'Sakoo Sai Moo (4 pcs)',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Tapioca dumplings filled with pork and peanuts',
        ),
        MenuItemModel(
          id: 'dim_sum_thai_style_3',
          name: 'Salapao Moo Daeng (2 pcs)',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Steamed buns with barbecue pork filling',
        ),
        MenuItemModel(
          id: 'dim_sum_thai_style_4',
          name: 'Khanom Pang Na Moo (4 pcs)',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Deep-fried minced pork toast with sesame seeds',
        ),
        MenuItemModel(
          id: 'dim_sum_thai_style_5',
          name: 'Thung Thong (5 pcs)',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Golden bags filled with minced chicken and shrimp',
        ),
      ],
    ),
    RestaurantModel(
      id: 'isaan_snack_shack',
      name: 'Isaan Snack Shack',
      rating: 4.8,
      deliveryTime: 20,
      distance: 2.1,
      imagePath: 'assets/images/food-cart (1).png',
      menu: [
        MenuItemModel(
          id: 'isaan_snack_shack_1',
          name: 'Som Tam Poo Plara',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Spicy papaya salad with pickled crab and fermented fish',
        ),
        MenuItemModel(
          id: 'isaan_snack_shack_2',
          name: 'Laab Moo Tod (5 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Fried spicy minced pork balls with herbs',
        ),
        MenuItemModel(
          id: 'isaan_snack_shack_3',
          name: 'Khao Jee',
          price: 49,
          image: _getRandomImagePath(),
          description: 'Grilled sticky rice skewers with egg coating',
        ),
        MenuItemModel(
          id: 'isaan_snack_shack_4',
          name: 'Nam Tok Moo',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Spicy grilled pork salad with roasted rice powder',
        ),
        MenuItemModel(
          id: 'isaan_snack_shack_5',
          name: 'Soop Naw Mai',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Spicy bamboo shoot salad with herbs and roasted rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'royal_thai_appetizers',
      name: 'Royal Thai Appetizers',
      rating: 4.7,
      deliveryTime: 30,
      distance: 2.8,
      imagePath: 'assets/images/food-stall (2).png',
      menu: [
        MenuItemModel(
          id: 'royal_thai_appetizers_1',
          name: 'Chor Muang (4 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Purple flower-shaped dumplings with sweet pork filling',
        ),
        MenuItemModel(
          id: 'royal_thai_appetizers_2',
          name: 'Miang Kham (6 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Betel leaf wraps with coconut, ginger, lime and peanuts',
        ),
        MenuItemModel(
          id: 'royal_thai_appetizers_3',
          name: 'Tung Tong (5 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Golden money bags with premium seafood filling',
        ),
        MenuItemModel(
          id: 'royal_thai_appetizers_4',
          name: 'Gai Hor Bai Toey (4 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Pandan leaf-wrapped chicken with special sauce',
        ),
        MenuItemModel(
          id: 'royal_thai_appetizers_5',
          name: 'Khao Tang Na Tang',
          price: 139,
          image: _getRandomImagePath(),
          description: 'Crispy rice crackers with coconut-shrimp dipping sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'bangkok_street_cart',
      name: 'Bangkok Street Cart',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/food-stall (1).png',
      menu: [
        MenuItemModel(
          id: 'bangkok_street_cart_1',
          name: 'Satay Gai (4 pcs)',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Grilled chicken skewers with peanut sauce',
        ),
        MenuItemModel(
          id: 'bangkok_street_cart_2',
          name: 'Look Chin Ping (6 pcs)',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Grilled meatballs on skewers with spicy sauce',
        ),
        MenuItemModel(
          id: 'bangkok_street_cart_3',
          name: 'Kanom Pak Mor (5 pcs)',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Steamed rice flour dumplings with savory filling',
        ),
        MenuItemModel(
          id: 'bangkok_street_cart_4',
          name: 'Kluay Kaek (4 pcs)',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Banana fritters with sesame seeds',
        ),
        MenuItemModel(
          id: 'bangkok_street_cart_5',
          name: 'I-Tim Kaeo (2 scoops)',
          price: 49,
          image: _getRandomImagePath(),
          description: 'Coconut ice cream with toppings in a cup',
        ),
      ],
    ),
    RestaurantModel(
      id: 'market_nibbles',
      name: 'Market Nibbles',
      rating: 4.5,
      deliveryTime: 20,
      distance: 1.9,
      imagePath: 'assets/images/food-cart.png',
      menu: [
        MenuItemModel(
          id: 'market_nibbles_1',
          name: 'Roti Mataba',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Stuffed pan-fried flatbread with curry dipping sauce',
        ),
        MenuItemModel(
          id: 'market_nibbles_2',
          name: 'Khao Lam',
          price: 59,
          image: _getRandomImagePath(),
          description:
              'Sweet sticky rice in bamboo with black beans and coconut milk',
        ),
        MenuItemModel(
          id: 'market_nibbles_3',
          name: 'Khao Niew Moon & Mamuang',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Sweet sticky rice with fresh mango slices',
        ),
        MenuItemModel(
          id: 'market_nibbles_4',
          name: 'Khao Kriab Pak Mor (4 pcs)',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Steamed rice skin dumplings with sweet radish filling',
        ),
        MenuItemModel(
          id: 'market_nibbles_5',
          name: 'Khanom Tokyo',
          price: 59,
          image: _getRandomImagePath(),
          description: 'Thai-style crispy crepe with sweet fillings',
        ),
      ],
    ),
    RestaurantModel(
      id: 'coastal_thai_bites',
      name: 'Coastal Thai Bites',
      rating: 4.7,
      deliveryTime: 25,
      distance: 2.4,
      imagePath: 'assets/images/noodle.png',
      menu: [
        MenuItemModel(
          id: 'coastal_thai_bites_1',
          name: 'Tod Mun Goong (5 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Deep-fried shrimp cakes with plum sauce',
        ),
        MenuItemModel(
          id: 'coastal_thai_bites_2',
          name: 'Goong Sarong (4 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Prawns wrapped in crispy noodles with sweet chili sauce',
        ),
        MenuItemModel(
          id: 'coastal_thai_bites_3',
          name: 'Hoy Kwam Tod',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Crispy fried clams with garlic and pepper',
        ),
        MenuItemModel(
          id: 'coastal_thai_bites_4',
          name: 'Yam Talay',
          price: 139,
          image: _getRandomImagePath(),
          description: 'Spicy mixed seafood salad with lime dressing',
        ),
        MenuItemModel(
          id: 'coastal_thai_bites_5',
          name: 'Pla Muk Yang',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Grilled squid with spicy seafood dipping sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'skewer_house',
      name: 'Skewer House',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/food-stall.png',
      menu: [
        MenuItemModel(
          id: 'skewer_house_1',
          name: 'Moo Ping (4 pcs)',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Marinated grilled pork skewers with sticky rice',
        ),
        MenuItemModel(
          id: 'skewer_house_2',
          name: 'Gai Yang Ping (3 pcs)',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Grilled chicken skewers with lemongrass and cilantro',
        ),
        MenuItemModel(
          id: 'skewer_house_3',
          name: 'Look Chin Ping Mix (8 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Mixed meatball skewers with spicy dipping sauce',
        ),
        MenuItemModel(
          id: 'skewer_house_4',
          name: 'Pla Muk Ping (2 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Grilled squid skewers with seafood sauce',
        ),
        MenuItemModel(
          id: 'skewer_house_5',
          name: 'Nua Yang (3 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Grilled beef skewers with tamarind dipping sauce',
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
