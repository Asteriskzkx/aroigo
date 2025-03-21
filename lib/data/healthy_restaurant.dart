import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class HealthyRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/salad.png',
    'assets/images/healthy-food.png',
    'assets/images/food (1).png',
    'assets/images/avocado.png',
    'assets/images/cherry.png',
    'assets/images/lemon.png',
    'assets/images/yogurt.png',
    'assets/images/strawberry.png',
    'assets/images/almond-milk.png',
    'assets/images/beverage (1).png',
    'assets/images/pumpkin.png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'clean_thai_kitchen',
      name: 'Clean Thai Kitchen',
      rating: 4.7,
      deliveryTime: 25,
      distance: 2.3,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'clean_thai_kitchen_1',
          name: 'Grilled Chicken Protein Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Lean grilled chicken with brown rice, steamed vegetables and light peanut sauce',
        ),
        MenuItemModel(
          id: 'clean_thai_kitchen_2',
          name: 'Steamed Fish with Lime',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Delicately steamed fish with fresh lime, garlic, chili and herbs',
        ),
        MenuItemModel(
          id: 'clean_thai_kitchen_3',
          name: 'Tom Yum Clear Soup',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Spicy clear broth with prawns, mushrooms and Thai herbs (no coconut milk)',
        ),
        MenuItemModel(
          id: 'clean_thai_kitchen_4',
          name: 'Quinoa Larb Bowl',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Traditional spicy larb with ground chicken, herbs and quinoa instead of rice',
        ),
        MenuItemModel(
          id: 'clean_thai_kitchen_5',
          name: 'Baked Satay Chicken',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Oven-baked chicken skewers with peanut sauce and cucumber salad',
        ),
      ],
    ),
    RestaurantModel(
      id: 'lean_green_thai',
      name: 'Lean & Green Thai',
      rating: 4.6,
      deliveryTime: 20,
      distance: 1.9,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'lean_green_thai_1',
          name: 'Green Curry with Cauliflower Rice',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Light green curry with chicken and vegetables served with cauliflower rice',
        ),
        MenuItemModel(
          id: 'lean_green_thai_2',
          name: 'Zoodle Pad Thai',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Classic pad thai made with zucchini noodles instead of rice noodles',
        ),
        MenuItemModel(
          id: 'lean_green_thai_3',
          name: 'Grilled Fish Power Bowl',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Grilled fish fillet on mixed greens, quinoa and Thai herbs',
        ),
        MenuItemModel(
          id: 'lean_green_thai_4',
          name: 'Steamed Chicken & Herbs',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Tender steamed chicken with lemongrass, lime leaves and fresh herbs',
        ),
        MenuItemModel(
          id: 'lean_green_thai_5',
          name: 'Som Tam No Sugar',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Fresh papaya salad with lime juice and chili, no added sugar',
        ),
      ],
    ),
    RestaurantModel(
      id: 'plant_powered_thai',
      name: 'Plant-Powered Thai',
      rating: 4.8,
      deliveryTime: 25,
      distance: 2.5,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'plant_powered_thai_1',
          name: 'Tofu Green Curry',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Plant-based green curry with organic tofu and seasonal vegetables',
        ),
        MenuItemModel(
          id: 'plant_powered_thai_2',
          name: 'Mushroom Larb Salad',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Spicy minced mushroom salad with fresh herbs and roasted rice powder',
        ),
        MenuItemModel(
          id: 'plant_powered_thai_3',
          name: 'Jackfruit Pad Prik Gaeng',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Young jackfruit stir-fried with red curry paste and vegetables',
        ),
        MenuItemModel(
          id: 'plant_powered_thai_4',
          name: 'Tom Kha Vegetable Soup',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Coconut milk soup with mixed vegetables and Thai herbs',
        ),
        MenuItemModel(
          id: 'plant_powered_thai_5',
          name: 'Fresh Spring Rolls',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Rice paper rolls filled with fresh vegetables, herbs and peanut sauce',
        ),
      ],
    ),
    RestaurantModel(
      id: 'protein_thai_pit',
      name: 'Protein Thai Pit',
      rating: 4.5,
      deliveryTime: 30,
      distance: 2.7,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'protein_thai_pit_1',
          name: 'Grilled Protein Platter',
          price: 189,
          image: _getRandomImagePath(),
          description:
              'Assorted grilled meats (chicken, beef, pork) with spicy dipping sauce and fresh vegetables',
        ),
        MenuItemModel(
          id: 'protein_thai_pit_2',
          name: 'Thai Beef Salad',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Grilled beef slices with fresh greens, cucumber, tomato and spicy lime dressing',
        ),
        MenuItemModel(
          id: 'protein_thai_pit_3',
          name: 'Satay Protein Box',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Grilled chicken skewers with cucumber salad and light peanut sauce',
        ),
        MenuItemModel(
          id: 'protein_thai_pit_4',
          name: 'Grilled Fish in Banana Leaf',
          price: 179,
          image: _getRandomImagePath(),
          description:
              'Fish fillet with Thai herbs, wrapped in banana leaf and grilled',
        ),
        MenuItemModel(
          id: 'protein_thai_pit_5',
          name: 'Naked Larb Bowl',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Spicy minced chicken salad served over mixed greens instead of rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'low_cal_thai',
      name: 'Low-Cal Thai',
      rating: 4.4,
      deliveryTime: 20,
      distance: 2.1,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'low_cal_thai_1',
          name: 'Steamed Sea Bass',
          price: 169,
          image: _getRandomImagePath(),
          description: 'Sea bass fillet steamed with lime, garlic and chili',
        ),
        MenuItemModel(
          id: 'low_cal_thai_2',
          name: 'Tom Jued Clear Soup',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Clear vegetable broth with tofu, minced pork and glass noodles',
        ),
        MenuItemModel(
          id: 'low_cal_thai_3',
          name: 'Yum Talay (Seafood Salad)',
          price: 159,
          image: _getRandomImagePath(),
          description: 'Fresh seafood mix with lime juice, chili and herbs',
        ),
        MenuItemModel(
          id: 'low_cal_thai_4',
          name: 'Herb-Grilled Chicken',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Grilled chicken breast with Thai herbs and lime dressing',
        ),
        MenuItemModel(
          id: 'low_cal_thai_5',
          name: 'Vegetable Stir-Fry',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Mixed vegetables stir-fried with light soy sauce and garlic',
        ),
      ],
    ),
    RestaurantModel(
      id: 'fresh_thai_smoothie',
      name: 'Fresh Thai Smoothie',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.6,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'fresh_thai_smoothie_1',
          name: 'Thai Green Smoothie',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Fresh smoothie with pandan leaves, spinach, pineapple and coconut water',
        ),
        MenuItemModel(
          id: 'fresh_thai_smoothie_2',
          name: 'Mango Protein Smoothie',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Fresh mango blended with yogurt, honey and whey protein',
        ),
        MenuItemModel(
          id: 'fresh_thai_smoothie_3',
          name: 'Coconut Detox Blend',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Young coconut water with banana, lime and chia seeds',
        ),
        MenuItemModel(
          id: 'fresh_thai_smoothie_4',
          name: 'Papaya Digestive Boost',
          price: 95,
          image: _getRandomImagePath(),
          description:
              'Ripe papaya, ginger, lemon and honey blend for digestion',
        ),
        MenuItemModel(
          id: 'fresh_thai_smoothie_5',
          name: 'Dragon Fruit Antioxidant',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Vibrant smoothie with dragon fruit, berries and lime juice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'fit_thai_salad',
      name: 'Fit Thai Salad',
      rating: 4.6,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'fit_thai_salad_1',
          name: 'Yum Woon Sen',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Glass noodle salad with prawns, minced chicken and spicy lime dressing',
        ),
        MenuItemModel(
          id: 'fit_thai_salad_2',
          name: 'Som Tam Super Green',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Traditional green papaya salad with extra vegetables and less sugar',
        ),
        MenuItemModel(
          id: 'fit_thai_salad_3',
          name: 'Larb Gai Salad Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description: 'Spicy minced chicken salad over mixed greens and herbs',
        ),
        MenuItemModel(
          id: 'fit_thai_salad_4',
          name: 'Yum Salmon',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Seared salmon pieces with fresh herbs, lime juice and chili',
        ),
        MenuItemModel(
          id: 'fit_thai_salad_5',
          name: 'Pomelo Clean Salad',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Fresh pomelo segments with grilled chicken, herbs and light dressing',
        ),
      ],
    ),
    RestaurantModel(
      id: 'low_carb_thai',
      name: 'Low-Carb Thai',
      rating: 4.5,
      deliveryTime: 25,
      distance: 2.4,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'low_carb_thai_1',
          name: 'Cauliflower Rice Green Curry',
          price: 149,
          image: _getRandomImagePath(),
          description: 'Green curry with chicken served with cauliflower rice',
        ),
        MenuItemModel(
          id: 'low_carb_thai_2',
          name: 'Zucchini Pad Thai',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Classic pad thai using zucchini noodles instead of rice noodles',
        ),
        MenuItemModel(
          id: 'low_carb_thai_3',
          name: 'Grilled Meat Platter',
          price: 169,
          image: _getRandomImagePath(),
          description:
              'Assorted grilled meats with fresh vegetables and nam jim jaew',
        ),
        MenuItemModel(
          id: 'low_carb_thai_4',
          name: 'Tom Yum Goong Clear',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Clear spicy and sour soup with prawns and mushrooms (no sugar added)',
        ),
        MenuItemModel(
          id: 'low_carb_thai_5',
          name: 'Grilled Fish Wrapped',
          price: 159,
          image: _getRandomImagePath(),
          description: 'White fish fillet grilled in pandan leaves with herbs',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_juice_bar',
      name: 'Thai Juice Bar',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'thai_juice_bar_1',
          name: 'Fresh Coconut Water',
          price: 65,
          image: _getRandomImagePath(),
          description:
              'Young coconut water served in the shell, natural electrolytes',
        ),
        MenuItemModel(
          id: 'thai_juice_bar_2',
          name: 'Watermelon Refresher',
          price: 75,
          image: _getRandomImagePath(),
          description: 'Freshly pressed watermelon juice with mint leaves',
        ),
        MenuItemModel(
          id: 'thai_juice_bar_3',
          name: 'Pineapple Ginger Boost',
          price: 85,
          image: _getRandomImagePath(),
          description:
              'Fresh pineapple juice with ginger and lime for immunity',
        ),
        MenuItemModel(
          id: 'thai_juice_bar_4',
          name: 'Mixed Thai Herb Detox',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Lemongrass, ginger, lime and honey with sparkling water',
        ),
        MenuItemModel(
          id: 'thai_juice_bar_5',
          name: 'Green Papaya Digestive',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Green papaya blended with lime and honey for digestion',
        ),
      ],
    ),
    RestaurantModel(
      id: 'organic_thai_grill',
      name: 'Organic Thai Grill',
      rating: 4.8,
      deliveryTime: 30,
      distance: 2.6,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'organic_thai_grill_1',
          name: 'Organic Gai Yang (Half)',
          price: 169,
          image: _getRandomImagePath(),
          description:
              'Free-range grilled chicken with organic herbs and tamarind dipping sauce',
        ),
        MenuItemModel(
          id: 'organic_thai_grill_2',
          name: 'Grilled Organic Vegetables',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Seasonal organic vegetables grilled with light marinade',
        ),
        MenuItemModel(
          id: 'organic_thai_grill_3',
          name: 'Wild-Caught Fish in Banana Leaf',
          price: 199,
          image: _getRandomImagePath(),
          description:
              'Sustainably caught fish with organic herbs, grilled in banana leaf',
        ),
        MenuItemModel(
          id: 'organic_thai_grill_4',
          name: 'Grass-Fed Beef Nam Tok',
          price: 179,
          image: _getRandomImagePath(),
          description:
              'Sliced grilled grass-fed beef with herbs and lime dressing',
        ),
        MenuItemModel(
          id: 'organic_thai_grill_5',
          name: 'Organic Brown Rice Som Tam Set',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Green papaya salad with organic ingredients, served with brown rice',
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
