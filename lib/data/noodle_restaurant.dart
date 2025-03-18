import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class NoodleRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/ramen.png',
    'assets/images/noodle (1).png',
    'assets/images/ramen (1).png',
    'assets/images/noodles.png',
    'assets/images/noodles (1).png',
    'assets/images/noodle (2).png',
    'assets/images/noodle (3).png',
    'assets/images/noodle (4).png',
    'assets/images/noodle (5).png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'pad_thai_masters',
      name: 'Pad Thai Masters',
      rating: 4.8,
      deliveryTime: 20,
      distance: 1.8,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'pad_thai_masters_1',
          name: 'Classic Pad Thai',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Stir-fried rice noodles with tofu, bean sprouts, egg, and crushed peanuts',
        ),
        MenuItemModel(
          id: 'pad_thai_masters_2',
          name: 'Pad Thai Goong Sod',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Signature pad thai with fresh prawns and special house sauce',
        ),
        MenuItemModel(
          id: 'pad_thai_masters_3',
          name: 'Pad Thai Poo',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Pad thai with fresh crab meat and egg wrapped in thin omelette',
        ),
        MenuItemModel(
          id: 'pad_thai_masters_4',
          name: 'Pad Thai Jay',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Vegetarian pad thai with tofu and extra vegetables',
        ),
        MenuItemModel(
          id: 'pad_thai_masters_5',
          name: 'Pad Thai Talay',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Pad thai with mixed seafood including prawns, squid, and mussels',
        ),
      ],
    ),
    RestaurantModel(
      id: 'kuay_tiew_central',
      name: 'Kuay Tiew Central',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.6,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'kuay_tiew_central_1',
          name: 'Kuay Tiew Moo Nam Sai',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Clear pork soup with rice noodles, bean sprouts and Thai herbs',
        ),
        MenuItemModel(
          id: 'kuay_tiew_central_2',
          name: 'Kuay Tiew Tom Yum',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Spicy and sour soup with rice noodles and your choice of protein',
        ),
        MenuItemModel(
          id: 'kuay_tiew_central_3',
          name: 'Kuay Tiew Gai Nam Tok',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Spicy chicken noodle soup with blood cubes and herbs',
        ),
        MenuItemModel(
          id: 'kuay_tiew_central_4',
          name: 'Kuay Tiew Reua Nuea',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Boat noodles with beef, herbs, and dark rich broth',
        ),
        MenuItemModel(
          id: 'kuay_tiew_central_5',
          name: 'Kuay Tiew Nam Sai Haeng',
          price: 79,
          image: _getRandomImagePath(),
          description: 'Dry noodles with light broth served on the side',
        ),
      ],
    ),
    RestaurantModel(
      id: 'ba_mee_kingdom',
      name: 'Ba Mee Kingdom',
      rating: 4.5,
      deliveryTime: 20,
      distance: 2.2,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'ba_mee_kingdom_1',
          name: 'Ba Mee Moo Daeng',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Egg noodles with red barbecue pork and bok choy',
        ),
        MenuItemModel(
          id: 'ba_mee_kingdom_2',
          name: 'Ba Mee Kiew Moo',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Egg noodles with pork wontons and crispy pork',
        ),
        MenuItemModel(
          id: 'ba_mee_kingdom_3',
          name: 'Ba Mee Haeng',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Dry egg noodles with garlic oil and your choice of toppings',
        ),
        MenuItemModel(
          id: 'ba_mee_kingdom_4',
          name: 'Ba Mee Nam',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Egg noodles in clear broth with bean sprouts and bok choy',
        ),
        MenuItemModel(
          id: 'ba_mee_kingdom_5',
          name: 'Ba Mee Tom Yum',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Egg noodles in spicy tom yum broth with minced pork',
        ),
      ],
    ),
    RestaurantModel(
      id: 'khao_soi_northern',
      name: 'Khao Soi Northern',
      rating: 4.7,
      deliveryTime: 25,
      distance: 2.6,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'khao_soi_northern_1',
          name: 'Khao Soi Gai',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Northern Thai curry noodles with chicken and crispy noodle topping',
        ),
        MenuItemModel(
          id: 'khao_soi_northern_2',
          name: 'Khao Soi Nuea',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Rich curry noodles with slow-cooked beef shanks',
        ),
        MenuItemModel(
          id: 'khao_soi_northern_3',
          name: 'Khao Soi Goong',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Curry noodles with prawns and fresh lime',
        ),
        MenuItemModel(
          id: 'khao_soi_northern_4',
          name: 'Khao Soi Jay',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Vegetarian curry noodles with tofu and mixed vegetables',
        ),
        MenuItemModel(
          id: 'khao_soi_northern_5',
          name: 'Khao Soi Pla',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Curry noodles with fish fillet and pickled mustard greens',
        ),
      ],
    ),
    RestaurantModel(
      id: 'sen_yai_house',
      name: 'Sen Yai House',
      rating: 4.5,
      deliveryTime: 25,
      distance: 2.1,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'sen_yai_house_1',
          name: 'Pad See Ew',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Stir-fried wide rice noodles with egg, Chinese broccoli and your choice of meat',
        ),
        MenuItemModel(
          id: 'sen_yai_house_2',
          name: 'Rad Na',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Wide rice noodles topped with thick gravy, Chinese broccoli and meat',
        ),
        MenuItemModel(
          id: 'sen_yai_house_3',
          name: 'Pad Kee Mao',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Spicy stir-fried drunken noodles with holy basil and vegetables',
        ),
        MenuItemModel(
          id: 'sen_yai_house_4',
          name: 'Guay Teow Kua Gai',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Stir-fried wide rice noodles with chicken and egg on lettuce',
        ),
        MenuItemModel(
          id: 'sen_yai_house_5',
          name: 'Pad Woon Sen',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Stir-fried glass noodles with egg and mixed vegetables',
        ),
      ],
    ),
    RestaurantModel(
      id: 'yen_ta_fo_pink',
      name: 'Yen Ta Fo Pink',
      rating: 4.4,
      deliveryTime: 20,
      distance: 1.9,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'yen_ta_fo_pink_1',
          name: 'Yen Ta Fo Classic',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Pink noodle soup with fish balls, tofu, morning glory and red sauce',
        ),
        MenuItemModel(
          id: 'yen_ta_fo_pink_2',
          name: 'Yen Ta Fo Seafood',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Pink soup with mixed seafood, crispy wonton and Thai watercress',
        ),
        MenuItemModel(
          id: 'yen_ta_fo_pink_3',
          name: 'Tom Yum Yen Ta Fo',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Spicy and sour pink noodle soup with lemongrass and lime',
        ),
        MenuItemModel(
          id: 'yen_ta_fo_pink_4',
          name: 'Yen Ta Fo Haeng',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Dry version of pink noodles with all toppings and sauce on the side',
        ),
        MenuItemModel(
          id: 'yen_ta_fo_pink_5',
          name: 'Yen Ta Fo Ruam Mit',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Pink noodle soup with mixed toppings including crispy pork and fish cakes',
        ),
      ],
    ),
    RestaurantModel(
      id: 'guay_jub_yuan',
      name: 'Guay Jub Yuan',
      rating: 4.3,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'guay_jub_yuan_1',
          name: 'Guay Jub Nam Khon',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Rolled rice noodles in peppery broth with pork belly and century egg',
        ),
        MenuItemModel(
          id: 'guay_jub_yuan_2',
          name: 'Guay Jub Moo Krob',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Rolled noodle soup with extra crispy pork belly',
        ),
        MenuItemModel(
          id: 'guay_jub_yuan_3',
          name: 'Guay Jub Ruam Mit',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Rolled noodle soup with assorted offal and crispy pork',
        ),
        MenuItemModel(
          id: 'guay_jub_yuan_4',
          name: 'Guay Jub Nam Sai',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Rolled noodle soup with clear broth, simpler and lighter version',
        ),
        MenuItemModel(
          id: 'guay_jub_yuan_5',
          name: 'Guay Jub Kai Paloe',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Rolled noodle soup with stewed eggs and five-spice pork',
        ),
      ],
    ),
    RestaurantModel(
      id: 'kanom_jeen_specialist',
      name: 'Kanom Jeen Specialist',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.3,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'kanom_jeen_specialist_1',
          name: 'Kanom Jeen Nam Ya Pla',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Fermented rice noodles with fish curry sauce and vegetables',
        ),
        MenuItemModel(
          id: 'kanom_jeen_specialist_2',
          name: 'Kanom Jeen Nam Ngiao',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Northern style rice noodles with spicy tomato and pork rib soup',
        ),
        MenuItemModel(
          id: 'kanom_jeen_specialist_3',
          name: 'Kanom Jeen Nam Prik',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Rice noodles with sweet coconut curry sauce and pork',
        ),
        MenuItemModel(
          id: 'kanom_jeen_specialist_4',
          name: 'Kanom Jeen Gaeng Keow Wan',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Rice noodles with green curry chicken and eggplant',
        ),
        MenuItemModel(
          id: 'kanom_jeen_specialist_5',
          name: 'Kanom Jeen Sao Nam',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Rice noodles with pineapple-based sauce and coconut milk',
        ),
      ],
    ),
    RestaurantModel(
      id: 'sukiyaki_thai_style',
      name: 'Sukiyaki Thai Style',
      rating: 4.5,
      deliveryTime: 25,
      distance: 2.5,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'sukiyaki_thai_style_1',
          name: 'Suki Nam',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Thai sukiyaki soup with glass noodles, seafood and vegetables',
        ),
        MenuItemModel(
          id: 'sukiyaki_thai_style_2',
          name: 'Suki Haeng',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Dry Thai sukiyaki with glass noodles, egg and special sauce',
        ),
        MenuItemModel(
          id: 'sukiyaki_thai_style_3',
          name: 'Suki Ruam',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Mixed sukiyaki with both seafood and meat options',
        ),
        MenuItemModel(
          id: 'sukiyaki_thai_style_4',
          name: 'Suki Vegetarian',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Vegetarian sukiyaki with tofu, mushrooms and mixed vegetables',
        ),
        MenuItemModel(
          id: 'sukiyaki_thai_style_5',
          name: 'Suki Kim Chi',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fusion Korean-Thai sukiyaki with kimchi and glass noodles',
        ),
      ],
    ),
    RestaurantModel(
      id: 'lad_na_specialist',
      name: 'Lad Na Specialist',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.0,
      imagePath: 'assets/images/noodle (6).png',
      menu: [
        MenuItemModel(
          id: 'lad_na_specialist_1',
          name: 'Lad Na Moo',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Wide rice noodles topped with pork and Chinese broccoli in thick gravy',
        ),
        MenuItemModel(
          id: 'lad_na_specialist_2',
          name: 'Lad Na Talay',
          price: 139,
          image: _getRandomImagePath(),
          description: 'Rice noodles with mixed seafood in gravy sauce',
        ),
        MenuItemModel(
          id: 'lad_na_specialist_3',
          name: 'Lad Na Crispy',
          price: 105,
          image: _getRandomImagePath(),
          description:
              'Crispy fried noodles topped with gravy and your choice of meat',
        ),
        MenuItemModel(
          id: 'lad_na_specialist_4',
          name: 'Lad Na Pla Khem',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Noodles with gravy and salted fish for extra umami flavor',
        ),
        MenuItemModel(
          id: 'lad_na_specialist_5',
          name: 'Lad Na Vegetarian',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Noodles with tofu and mixed vegetables in vegetarian gravy',
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
