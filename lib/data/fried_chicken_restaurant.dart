import 'dart:math';
import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class FriedChickenRestaurant {
  static final List<String> _imagePaths = [
    'assets/images/fried-chicken.png',
    'assets/images/fried-chicken (1).png',
    'assets/images/chicken.png',
    'assets/images/chicken (1).png',
    'assets/images/turkey-leg.png',
    'assets/images/turkey-leg (1).png',
    'assets/images/chicken (2).png',
    'assets/images/chicken (3).png',
    'assets/images/roast-chicken.png',
    'assets/images/roast-chicken (1).png',
    'assets/images/roast-chicken (2).png',
    'assets/images/roast-chicken (3).png',
  ];

  static final Random _random = Random();

  static String _getRandomImagePath() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
  }

  static final List<RestaurantModel> _restaurants = [
    RestaurantModel(
      id: 'gai_tod_siam',
      name: 'Gai Tod Siam',
      rating: 4.7,
      deliveryTime: 15,
      distance: 1.5,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'gai_tod_siam_1',
          name: 'Classic Gai Tod (3 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Crispy Thai-style fried chicken marinated with garlic and pepper',
        ),
        MenuItemModel(
          id: 'gai_tod_siam_2',
          name: 'Hat Yai Fried Chicken Set',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Southern-style fried chicken with crispy shallots and sticky rice',
        ),
        MenuItemModel(
          id: 'gai_tod_siam_3',
          name: 'Spicy Fried Chicken Wings (6 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Crispy wings tossed in spicy Thai chili glaze',
        ),
        MenuItemModel(
          id: 'gai_tod_siam_4',
          name: 'Garlic Fried Chicken Rice Box',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fried chicken over rice with fried garlic and sweet chili sauce',
        ),
        MenuItemModel(
          id: 'gai_tod_siam_5',
          name: 'Family Bucket (10 pcs)',
          price: 259,
          image: _getRandomImagePath(),
          description:
              'Mixed pieces of fried chicken with two dipping sauces and sticky rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'hat_yai_fried_chicken',
      name: 'Hat Yai Fried Chicken',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.1,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'hat_yai_fried_chicken_1',
          name: 'Original Hat Yai Set',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Southern-style fried chicken with crispy shallots, sticky rice and spicy sauce',
        ),
        MenuItemModel(
          id: 'hat_yai_fried_chicken_2',
          name: 'Hat Yai Fried Chicken Only (3 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Crispy southern fried chicken with signature Hat Yai seasoning',
        ),
        MenuItemModel(
          id: 'hat_yai_fried_chicken_3',
          name: 'Hat Yai Spicy Wings (6 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Crispy wings with southern Thai spices and dried chili',
        ),
        MenuItemModel(
          id: 'hat_yai_fried_chicken_4',
          name: 'Hat Yai Fried Chicken Over Rice',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Fried chicken pieces served over jasmine rice with fried shallots and sauce',
        ),
        MenuItemModel(
          id: 'hat_yai_fried_chicken_5',
          name: 'Family Box with Som Tam',
          price: 299,
          image: _getRandomImagePath(),
          description:
              'Large box of Hat Yai fried chicken with green papaya salad and sticky rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'zaab_wings',
      name: 'Zaab Wings',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.7,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'zaab_wings_1',
          name: 'Isaan-Style Wings (6 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Fried wings tossed in spicy Northeastern Thai seasonings with nam jim jaew',
        ),
        MenuItemModel(
          id: 'zaab_wings_2',
          name: 'Tom Yum Wings (6 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Wings coated in tom yum paste with lemongrass and lime leaf',
        ),
        MenuItemModel(
          id: 'zaab_wings_3',
          name: 'Nam Tok Wings (6 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Wings tossed in spicy Isaan dressing with roasted rice powder and herbs',
        ),
        MenuItemModel(
          id: 'zaab_wings_4',
          name: 'Zaab Wing Sampler (12 pcs)',
          price: 209,
          image: _getRandomImagePath(),
          description:
              'Four wings each of our signature flavors with sticky rice',
        ),
        MenuItemModel(
          id: 'zaab_wings_5',
          name: 'Larb Boneless Wings (10 pcs)',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Boneless chicken pieces tossed in spicy larb seasoning with herbs',
        ),
      ],
    ),
    RestaurantModel(
      id: 'bangkok_crispy_chicken',
      name: 'Bangkok Crispy Chicken',
      rating: 4.4,
      deliveryTime: 20,
      distance: 2.3,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'bangkok_crispy_chicken_1',
          name: 'Bangkok Fried Chicken (2 pcs)',
          price: 79,
          image: _getRandomImagePath(),
          description:
              'Central Thai style fried chicken with crispy skin and juicy meat',
        ),
        MenuItemModel(
          id: 'bangkok_crispy_chicken_2',
          name: 'Sriracha Glazed Chicken (2 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Fried chicken glazed with spicy sriracha sauce',
        ),
        MenuItemModel(
          id: 'bangkok_crispy_chicken_3',
          name: 'Crispy Chicken Over Rice',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Fried chicken pieces served over jasmine rice with sweet chili sauce',
        ),
        MenuItemModel(
          id: 'bangkok_crispy_chicken_4',
          name: 'Garlic Pepper Fried Chicken (2 pcs)',
          price: 85,
          image: _getRandomImagePath(),
          description: 'Fried chicken with extra garlic and pepper crust',
        ),
        MenuItemModel(
          id: 'bangkok_crispy_chicken_5',
          name: 'Crispy Chicken & Som Tam Set',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Two pieces of fried chicken with papaya salad and sticky rice',
        ),
      ],
    ),
    RestaurantModel(
      id: 'gai_yang_fusion',
      name: 'Gai Yang Fusion',
      rating: 4.7,
      deliveryTime: 25,
      distance: 2.5,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'gai_yang_fusion_1',
          name: 'Gai Yang & Tod Combo',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Half grilled chicken and two pieces of fried chicken with sticky rice',
        ),
        MenuItemModel(
          id: 'gai_yang_fusion_2',
          name: 'Fried Gai Yang-Style Chicken',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fried chicken marinated in grilled chicken herbs and spices',
        ),
        MenuItemModel(
          id: 'gai_yang_fusion_3',
          name: 'Fried Lemongrass Chicken (3 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Chicken marinated with lemongrass then deep-fried to perfection',
        ),
        MenuItemModel(
          id: 'gai_yang_fusion_4',
          name: 'Crispy Coconut Chicken (3 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fried chicken coated in coconut flakes and aromatic herbs',
        ),
        MenuItemModel(
          id: 'gai_yang_fusion_5',
          name: 'Fried Chicken with Sticky Rice & Dips',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Assorted fried chicken pieces with sticky rice and three signature dips',
        ),
      ],
    ),
    RestaurantModel(
      id: 'crispy_tenders_bangkok',
      name: 'Crispy Tenders Bangkok',
      rating: 4.5,
      deliveryTime: 15,
      distance: 1.8,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'crispy_tenders_bangkok_1',
          name: 'Thai Herb Tenders (5 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Crispy chicken tenders marinated with Thai herbs and spices',
        ),
        MenuItemModel(
          id: 'crispy_tenders_bangkok_2',
          name: 'Tom Yum Tenders (5 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Chicken tenders with spicy tom yum coating and lime dip',
        ),
        MenuItemModel(
          id: 'crispy_tenders_bangkok_3',
          name: 'Satay Tenders Basket (5 pcs)',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Chicken tenders with peanut satay sauce and cucumber relish',
        ),
        MenuItemModel(
          id: 'crispy_tenders_bangkok_4',
          name: 'Tenders Box with Fries',
          price: 159,
          image: _getRandomImagePath(),
          description:
              'Five crispy tenders with seasoned fries and dipping sauce',
        ),
        MenuItemModel(
          id: 'crispy_tenders_bangkok_5',
          name: 'Family Tender Pack (15 pcs)',
          price: 279,
          image: _getRandomImagePath(),
          description:
              'Large pack of mixed flavor tenders with three dipping sauces',
        ),
      ],
    ),
    RestaurantModel(
      id: 'sticky_rice_chicken',
      name: 'Sticky Rice & Chicken',
      rating: 4.6,
      deliveryTime: 20,
      distance: 2.0,
      imagePath: 'assets/images/restaurant (6).png',
      menu: [
        MenuItemModel(
          id: 'sticky_rice_chicken_1',
          name: 'Fried Chicken & Sticky Rice Set',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Two pieces of fried chicken with sticky rice and nam jim jaew sauce',
        ),
        MenuItemModel(
          id: 'sticky_rice_chicken_2',
          name: 'Spicy Fried Chicken & Som Tam',
          price: 129,
          image: _getRandomImagePath(),
          description:
              'Spicy fried chicken with green papaya salad and sticky rice',
        ),
        MenuItemModel(
          id: 'sticky_rice_chicken_3',
          name: 'Larb Fried Chicken Bowl',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Fried chicken pieces tossed in spicy larb seasoning over sticky rice',
        ),
        MenuItemModel(
          id: 'sticky_rice_chicken_4',
          name: 'Fried Chicken Wings & Sticky Rice (6 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Crispy fried wings with sticky rice and spicy dipping sauce',
        ),
        MenuItemModel(
          id: 'sticky_rice_chicken_5',
          name: 'Isaan Fried Chicken Feast',
          price: 259,
          image: _getRandomImagePath(),
          description:
              'Family size fried chicken with som tam, sticky rice, and larb',
        ),
      ],
    ),
    RestaurantModel(
      id: 'thai_chicken_crisp',
      name: 'Thai Chicken Crisp',
      rating: 4.3,
      deliveryTime: 15,
      distance: 1.9,
      imagePath: 'assets/images/restaurant.png',
      menu: [
        MenuItemModel(
          id: 'thai_chicken_crisp_1',
          name: 'Double-Fried Thai Chicken (2 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description: 'Extra crispy double-fried chicken with Thai seasonings',
        ),
        MenuItemModel(
          id: 'thai_chicken_crisp_2',
          name: 'Crispy Skin Chicken (Half)',
          price: 149,
          image: _getRandomImagePath(),
          description:
              'Half chicken fried to crispy perfection with special herb rub',
        ),
        MenuItemModel(
          id: 'thai_chicken_crisp_3',
          name: 'Spicy Crispy Tenders (5 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description: 'Crispy chicken tenders with spicy dipping sauce',
        ),
        MenuItemModel(
          id: 'thai_chicken_crisp_4',
          name: 'Crispy Wings Basket (8 pcs)',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Extra crispy wings with your choice of sauce',
        ),
        MenuItemModel(
          id: 'thai_chicken_crisp_5',
          name: 'Crispy Chicken Rice Bowl',
          price: 109,
          image: _getRandomImagePath(),
          description:
              'Crispy chicken pieces over jasmine rice with sweet soy glaze',
        ),
      ],
    ),
    RestaurantModel(
      id: 'isaan_fried_chicken',
      name: 'Isaan Fried Chicken',
      rating: 4.8,
      deliveryTime: 20,
      distance: 2.2,
      imagePath: 'assets/images/restaurant (1).png',
      menu: [
        MenuItemModel(
          id: 'isaan_fried_chicken_1',
          name: 'Northeastern Style Fried Chicken (2 pcs)',
          price: 89,
          image: _getRandomImagePath(),
          description:
              'Fried chicken with Isaan herbs and spices, served with sticky rice',
        ),
        MenuItemModel(
          id: 'isaan_fried_chicken_2',
          name: 'Nam Tok Fried Chicken',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Fried chicken tossed in spicy waterfall salad dressing with herbs',
        ),
        MenuItemModel(
          id: 'isaan_fried_chicken_3',
          name: 'Som Tam & Fried Chicken Set',
          price: 139,
          image: _getRandomImagePath(),
          description:
              'Two pieces of fried chicken with spicy green papaya salad and sticky rice',
        ),
        MenuItemModel(
          id: 'isaan_fried_chicken_4',
          name: 'Laab Fried Chicken',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Chopped fried chicken tossed with spicy larb seasoning, mint and lime',
        ),
        MenuItemModel(
          id: 'isaan_fried_chicken_5',
          name: 'Isaan Family Feast',
          price: 299,
          image: _getRandomImagePath(),
          description:
              'Large serving of fried chicken with som tam, larb, sticky rice and dips',
        ),
      ],
    ),
    RestaurantModel(
      id: 'golden_thai_chicken',
      name: 'Golden Thai Chicken',
      rating: 4.4,
      deliveryTime: 20,
      distance: 2.4,
      imagePath: 'assets/images/restaurant (5).png',
      menu: [
        MenuItemModel(
          id: 'golden_thai_chicken_1',
          name: 'Golden Fried Chicken (3 pcs)',
          price: 99,
          image: _getRandomImagePath(),
          description:
              'Crispy fried chicken with golden turmeric batter and Thai herbs',
        ),
        MenuItemModel(
          id: 'golden_thai_chicken_2',
          name: 'Golden Thai Wings (6 pcs)',
          price: 109,
          image: _getRandomImagePath(),
          description: 'Crispy wings with turmeric and lemongrass coating',
        ),
        MenuItemModel(
          id: 'golden_thai_chicken_3',
          name: 'Golden Tenders & Fries',
          price: 129,
          image: _getRandomImagePath(),
          description: 'Turmeric-battered chicken tenders with seasoned fries',
        ),
        MenuItemModel(
          id: 'golden_thai_chicken_4',
          name: 'Golden Chicken Rice Box',
          price: 119,
          image: _getRandomImagePath(),
          description:
              'Golden fried chicken over jasmine rice with sweet chili sauce',
        ),
        MenuItemModel(
          id: 'golden_thai_chicken_5',
          name: 'Family Golden Bucket (10 pcs)',
          price: 289,
          image: _getRandomImagePath(),
          description:
              'Large bucket of golden fried chicken with three dipping sauces',
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
