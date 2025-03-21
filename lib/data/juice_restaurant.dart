import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class JuiceRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/tomato-juice.png',
    'assets/images/grapefruit.png',
    'assets/images/pear.png',
    'assets/images/beetroot.png',
    'assets/images/coconut.png',
    'assets/images/watermelon.png',
    'assets/images/pineapple.png',
    'assets/images/mango.png',
    'assets/images/blueberry.png',
    'assets/images/celery.png',
    'assets/images/grape.png',
    'assets/images/peach.png',
    'assets/images/green-apple.png',
    'assets/images/cherry (1).png',
    'assets/images/raspberry.png',
    'assets/images/pomegranate.png',
    'assets/images/cherry-juice.png',
    'assets/images/passion-fruit.png',
    'assets/images/beverage (2).png',
    'assets/images/apricot.png',
    'assets/images/banana.png',
    'assets/images/lemon-juice.png',
    'assets/images/juice.png',
    'assets/images/smoothies.png',
    'assets/images/juice (1).png',
    'assets/images/strawberry (1).png',
    'assets/images/kale.png',
    'assets/images/cantaloupe.png',
    'assets/images/beverage (3).png',
    'assets/images/kiwi.png',
    'assets/images/juice (2).png',
    'assets/images/juice (3).png',
    'assets/images/orange-juice.png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'tropical_thai_juice',
      name: 'Tropical Thai Juice',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.5,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'tropical_thai_juice_1',
          name: 'Fresh Young Coconut',
          price: 65,
          image: _getRandomImagePath(),
          description:
              'Refreshing young coconut water served directly in the shell',
        ),
        MenuItemModel(
          id: 'tropical_thai_juice_2',
          name: 'Mango Smoothie',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Creamy smoothie made with ripe Thai mangoes and a touch of honey',
        ),
        MenuItemModel(
          id: 'tropical_thai_juice_3',
          name: 'Pineapple Delight',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Freshly pressed pineapple juice with a hint of mint',
        ),
        MenuItemModel(
          id: 'tropical_thai_juice_4',
          name: 'Watermelon Refresher',
          price: 65,
          image: _getRandomImagePath(),
          description:
              'Pure watermelon juice, cold-pressed to preserve nutrients',
        ),
        MenuItemModel(
          id: 'tropical_thai_juice_5',
          name: 'Mixed Tropical Blast',
          price: 89,
          image: _getRandomImagePath(),
          description: 'A blend of mango, pineapple, and passion fruit juices',
        ),
      ],
    ),
    RestaurantModel(
      id: 'coconut_heaven',
      name: 'Coconut Heaven',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'coconut_heaven_1',
          name: 'Premium Young Coconut',
          price: 75,
          image: _getRandomImagePath(),
          description:
              'Aromatic and sweet coconut water in its natural container',
        ),
        MenuItemModel(
          id: 'coconut_heaven_2',
          name: 'Coconut Smoothie',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Creamy blend of coconut meat, coconut water, and a touch of coconut milk',
        ),
        MenuItemModel(
          id: 'coconut_heaven_3',
          name: 'Coconut Coffee',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Thai coffee blended with coconut milk and coconut syrup',
        ),
        MenuItemModel(
          id: 'coconut_heaven_4',
          name: 'Coconut Berry Blend',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Mixed berries blended with coconut water and coconut flesh',
        ),
        MenuItemModel(
          id: 'coconut_heaven_5',
          name: 'Coconut Lime Refresher',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Young coconut water with fresh lime juice and mint leaves',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_herb_infusions',
      name: 'Thai Herb Infusions',
      rating: 4.8,
      deliveryTime: 20,
      distance: 2.2,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'thai_herb_infusions_1',
          name: 'Lemongrass Cooler',
          price: 69,
          image: _getRandomImagePath(),
          description:
              'Refreshing lemongrass infused water with lime and honey',
        ),
        MenuItemModel(
          id: 'thai_herb_infusions_2',
          name: 'Pandan Coconut Drink',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Aromatic pandan leaf infused in coconut water with a hint of sweetness',
        ),
        MenuItemModel(
          id: 'thai_herb_infusions_3',
          name: 'Butterfly Pea Tea',
          price: 75,
          image: _getRandomImagePath(),
          description:
              'Blue butterfly pea flower tea that changes color with lime juice',
        ),
        MenuItemModel(
          id: 'thai_herb_infusions_4',
          name: 'Ginger Lemongrass Tonic',
          price: 75,
          image: _getRandomImagePath(),
          description:
              'Warming ginger and lemongrass infusion with honey and cinnamon',
        ),
        MenuItemModel(
          id: 'thai_herb_infusions_5',
          name: 'Thai Basil Limeade',
          price: 69,
          image: _getRandomImagePath(),
          description:
              'Fresh lime juice with crushed Thai basil leaves and a touch of honey',
        ),
      ],
    ),
    RestaurantModel(
      id: 'detox_thai_drinks',
      name: 'Detox Thai Drinks',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.9,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'detox_thai_drinks_1',
          name: 'Green Thai Cleanse',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Kale, cucumber, celery, green apple, and lime juice blend',
        ),
        MenuItemModel(
          id: 'detox_thai_drinks_2',
          name: 'Turmeric Ginger Shot',
          price: 59,
          image: _getRandomImagePath(),
          description:
              'Potent shot of fresh turmeric, ginger, lime, and black pepper',
        ),
        MenuItemModel(
          id: 'detox_thai_drinks_3',
          name: 'Charcoal Lemonade',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Activated charcoal with fresh lemon juice, filtered water, and honey',
        ),
        MenuItemModel(
          id: 'detox_thai_drinks_4',
          name: 'Morning Glory Detox',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Beetroot, carrot, apple, and ginger juice blend for morning vitality',
        ),
        MenuItemModel(
          id: 'detox_thai_drinks_5',
          name: 'Chlorophyll Water',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Purified water with liquid chlorophyll, mint, and lime',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_smoothie_bowl',
      name: 'Thai Smoothie Bowl',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.0,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'thai_smoothie_bowl_1',
          name: 'Mango Sticky Rice Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Mango smoothie base topped with sticky rice, fresh mango, and coconut milk',
        ),
        MenuItemModel(
          id: 'thai_smoothie_bowl_2',
          name: 'Dragon Fruit Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Vibrant pink dragon fruit smoothie topped with granola and tropical fruits',
        ),
        MenuItemModel(
          id: 'thai_smoothie_bowl_3',
          name: 'Thai Tea Smoothie Bowl',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Thai tea flavored smoothie base with banana, topped with nuts and honey',
        ),
        MenuItemModel(
          id: 'thai_smoothie_bowl_4',
          name: 'Coconut Acai Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Acai blended with coconut milk and topped with tropical fruits and chia seeds',
        ),
        MenuItemModel(
          id: 'thai_smoothie_bowl_5',
          name: 'Pandan Banana Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Pandan-infused smoothie with banana, topped with nuts and coconut flakes',
        ),
      ],
    ),
    RestaurantModel(
      id: 'isaan_freshness',
      name: 'Isaan Freshness',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'isaan_freshness_1',
          name: 'Som Tam Juice',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Green papaya juice with lime, a hint of chili, and palm sugar',
        ),
        MenuItemModel(
          id: 'isaan_freshness_2',
          name: 'Tamarind Cooler',
          price: 69,
          image: _getRandomImagePath(),
          description: 'Sweet and sour tamarind juice with a touch of honey',
        ),
        MenuItemModel(
          id: 'isaan_freshness_3',
          name: 'Cucumber Lime Refresher',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Cooling cucumber juice with lime and mint',
        ),
        MenuItemModel(
          id: 'isaan_freshness_4',
          name: 'Sugarcane Delight',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Freshly pressed sugarcane juice with a squeeze of lime',
        ),
        MenuItemModel(
          id: 'isaan_freshness_5',
          name: 'Roselle Iced Tea',
          price: 65,
          image: _getRandomImagePath(),
          description:
              'Ruby-red roselle flower tea sweetened with a hint of honey',
        ),
      ],
    ),
    RestaurantModel(
      id: 'royal_thai_elixir',
      name: 'Royal Thai Elixir',
      rating: 4.8,
      deliveryTime: 20,
      distance: 2.3,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'royal_thai_elixir_1',
          name: 'Chrysanthemum Honey Tea',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Delicate chrysanthemum flowers steeped in hot water with premium honey',
        ),
        MenuItemModel(
          id: 'royal_thai_elixir_2',
          name: 'Royal Thai Milk Tea',
          price: 95,
          image: _getRandomImagePath(),
          description: 'Premium Thai tea with organic milk and royal honey',
        ),
        MenuItemModel(
          id: 'royal_thai_elixir_3',
          name: 'Butterfly Pea Royal Tea',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Color-changing butterfly pea flower tea with honey and lime',
        ),
        MenuItemModel(
          id: 'royal_thai_elixir_4',
          name: 'Pandan Coconut Elixir',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Aromatic pandan-infused coconut water with a touch of palm sugar',
        ),
        MenuItemModel(
          id: 'royal_thai_elixir_5',
          name: 'Longan and Ginger Tea',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Warming tea with dried longan fruit, ginger, and premium red dates',
        ),
      ],
    ),
    RestaurantModel(
      id: 'exotic_fruit_bar',
      name: 'Exotic Fruit Bar',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'exotic_fruit_bar_1',
          name: 'Dragon Fruit Refresher',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Vibrant pink dragon fruit juice with lime and mint',
        ),
        MenuItemModel(
          id: 'exotic_fruit_bar_2',
          name: 'Mangosteen Delight',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Rare and delicious mangosteen juice blend with a hint of lime',
        ),
        MenuItemModel(
          id: 'exotic_fruit_bar_3',
          name: 'Rambutan Nectar',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Sweet and aromatic rambutan fruit juice with a touch of honey',
        ),
        MenuItemModel(
          id: 'exotic_fruit_bar_4',
          name: 'Longan Refresher',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Refreshing longan fruit juice with lime and a hint of ginger',
        ),
        MenuItemModel(
          id: 'exotic_fruit_bar_5',
          name: 'Durian Smoothie',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Rich and creamy durian fruit blended with coconut milk (for the brave!)',
        ),
      ],
    ),
    RestaurantModel(
      id: 'super_fuel_juicery',
      name: 'Super Fuel Juicery',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.9,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'super_fuel_juicery_1',
          name: 'Morning Booster',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Energizing blend of orange, carrot, ginger, and turmeric',
        ),
        MenuItemModel(
          id: 'super_fuel_juicery_2',
          name: 'Protein Green Smoothie',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Spinach, banana, spirulina, whey protein, and almond milk blend',
        ),
        MenuItemModel(
          id: 'super_fuel_juicery_3',
          name: 'Pre-Workout Energizer',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Beetroot, apple, lemon, and ginger juice for natural energy',
        ),
        MenuItemModel(
          id: 'super_fuel_juicery_4',
          name: 'Recovery Blend',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Coconut water, banana, pineapple, and protein for post-exercise',
        ),
        MenuItemModel(
          id: 'super_fuel_juicery_5',
          name: 'Immune Defence Shot',
          price: 59,
          image: _getRandomImagePath(),
          description:
              'Potent shot of ginger, turmeric, lemon, cayenne, and honey',
        ),
      ],
    ),
    RestaurantModel(
      id: 'nom_yen_cafe',
      name: 'Nom Yen Cafe',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.6,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'nom_yen_cafe_1',
          name: 'Classic Nom Yen',
          price: 65,
          image: _getRandomImagePath(),
          description: 'Traditional Thai pink milk with sala syrup and milk',
        ),
        MenuItemModel(
          id: 'nom_yen_cafe_2',
          name: 'Thai Iced Tea',
          price: 69,
          image: _getRandomImagePath(),
          description:
              'Authentic Thai tea with sweetened condensed milk over ice',
        ),
        MenuItemModel(
          id: 'nom_yen_cafe_3',
          name: 'Thai Iced Coffee',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Strong Thai coffee mixed with sweetened condensed milk',
        ),
        MenuItemModel(
          id: 'nom_yen_cafe_4',
          name: 'Pandan Milk',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Green pandan-infused milk drink with a hint of sweetness',
        ),
        MenuItemModel(
          id: 'nom_yen_cafe_5',
          name: 'Chocolate Nom Yen',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Pink milk infused with chocolate flavor and topped with whipped cream',
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
