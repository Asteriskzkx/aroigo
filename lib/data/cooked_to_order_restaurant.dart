import 'package:aroigo/model/menu_model.dart';
import 'package:aroigo/model/restaurant_model.dart';

class CookedToOrderRestaurant {
  static List<RestaurantModel> getRestaurants() {
    return [
      RestaurantModel(
        id: 'krua_mae_sai',
        name: 'Krua Mae Sai',
        rating: 4.7,
        deliveryTime: 30,
        distance: 3.3,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'krua_mae_sai_1',
            name: 'Gaeng Hang Lay',
            price: 129,
            image: 'assets/images/food-container (1).png',
            description: 'Northern Thai pork curry with ginger and tamarind',
          ),
          MenuItemModel(
            id: 'krua_mae_sai_2',
            name: 'Nam Prik Noom',
            price: 89,
            image: 'assets/images/food-container.png',
            description: 'Roasted green chili dip served with fresh vegetables',
          ),
          MenuItemModel(
            id: 'krua_mae_sai_3',
            name: 'Sai Oua',
            price: 149,
            image: 'assets/images/food-container (1).png',
            description:
                'Northern Thai herb sausage with lemongrass and kaffir lime',
          ),
          MenuItemModel(
            id: 'krua_mae_sai_4',
            name: 'Khao Soi Gai',
            price: 119,
            image: 'assets/images/food-container.png',
            description:
                'Curry noodle soup with chicken, crispy noodles and pickled mustard greens',
          ),
          MenuItemModel(
            id: 'krua_mae_sai_5',
            name: 'Nam Ngiao',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description: 'Spicy tomato and pork rib soup with rice noodles',
          ),
        ],
      ),
      RestaurantModel(
        id: 'som_tam_jay_noi',
        name: 'Som Tam Jay Noi',
        rating: 4.6,
        deliveryTime: 20,
        distance: 2.1,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'som_tam_jay_noi_1',
            name: 'Som Tam Thai',
            price: 79,
            image: 'assets/images/food-container (1).png',
            description:
                'Traditional papaya salad with peanuts and dried shrimp',
          ),
          MenuItemModel(
            id: 'som_tam_jay_noi_2',
            name: 'Som Tam Poo Plara',
            price: 89,
            image: 'assets/images/food-container.png',
            description:
                'Papaya salad with pickled crab and fermented fish sauce',
          ),
          MenuItemModel(
            id: 'som_tam_jay_noi_3',
            name: 'Kai Yang',
            price: 129,
            image: 'assets/images/food-container (1).png',
            description: 'Grilled marinated chicken with Isaan herbs',
          ),
          MenuItemModel(
            id: 'som_tam_jay_noi_4',
            name: 'Laab Moo',
            price: 99,
            image: 'assets/images/food-container.png',
            description:
                'Spicy minced pork salad with herbs and toasted rice powder',
          ),
          MenuItemModel(
            id: 'som_tam_jay_noi_5',
            name: 'Nam Tok Moo',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description: 'Grilled pork salad with herbs and lime dressing',
          ),
        ],
      ),
      RestaurantModel(
        id: 'baan_pad_thai',
        name: 'Baan Pad Thai',
        rating: 4.5,
        deliveryTime: 25,
        distance: 2.5,
        imagePath: 'assets/images/restaurant (6).png',
        menu: [
          MenuItemModel(
            id: 'baan_pad_thai_1',
            name: 'Pad Thai Goong Sod',
            price: 119,
            image: 'assets/images/food-container (1).png',
            description:
                'Stir-fried rice noodles with fresh prawns, tofu and bean sprouts',
          ),
          MenuItemModel(
            id: 'baan_pad_thai_2',
            name: 'Pad See Ew Gai',
            price: 99,
            image: 'assets/images/food-container.png',
            description:
                'Stir-fried wide rice noodles with chicken and Chinese broccoli',
          ),
          MenuItemModel(
            id: 'baan_pad_thai_3',
            name: 'Rad Na Talay',
            price: 149,
            image: 'assets/images/food-container (1).png',
            description: 'Wide rice noodles with seafood in thick gravy sauce',
          ),
          MenuItemModel(
            id: 'baan_pad_thai_4',
            name: 'Guay Teow Kua Gai',
            price: 89,
            image: 'assets/images/food-container.png',
            description: 'Stir-fried wide rice noodles with chicken and eggs',
          ),
          MenuItemModel(
            id: 'baan_pad_thai_5',
            name: 'Pad Kee Mao Moo',
            price: 109,
            image: 'assets/images/food-container (1).png',
            description:
                'Spicy stir-fried drunken noodles with pork and holy basil',
          ),
        ],
      ),
      RestaurantModel(
        id: 'tom_yum_gung_rak',
        name: 'Tom Yum Gung Rak',
        rating: 4.8,
        deliveryTime: 35,
        distance: 3.0,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'tom_yum_gung_rak_1',
            name: 'Tom Yum Goong Nam Kon',
            price: 159,
            image: 'assets/images/food-container (1).png',
            description: 'Creamy spicy and sour soup with prawns and mushrooms',
          ),
          MenuItemModel(
            id: 'tom_yum_gung_rak_2',
            name: 'Tom Kha Gai',
            price: 129,
            image: 'assets/images/food-container.png',
            description: 'Coconut soup with chicken, galangal and lemongrass',
          ),
          MenuItemModel(
            id: 'tom_yum_gung_rak_3',
            name: 'Pla Kapong Tom Som',
            price: 199,
            image: 'assets/images/food-container (1).png',
            description: 'Sea bass in sour tamarind soup with herbs',
          ),
          MenuItemModel(
            id: 'tom_yum_gung_rak_4',
            name: 'Tom Sap Kradook Moo',
            price: 139,
            image: 'assets/images/food-container.png',
            description: 'Spicy and sour pork rib soup with Thai herbs',
          ),
          MenuItemModel(
            id: 'tom_yum_gung_rak_5',
            name: 'Gang Som Pla',
            price: 149,
            image: 'assets/images/food-container (1).png',
            description: 'Sour orange curry with fish and mixed vegetables',
          ),
        ],
      ),
      RestaurantModel(
        id: 'khrua_bangkok_old',
        name: 'Khrua Bangkok Old',
        rating: 4.5,
        deliveryTime: 30,
        distance: 2.8,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'khrua_bangkok_old_1',
            name: 'Khao Mun Gai',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description: 'Aromatic chicken rice with special dipping sauce',
          ),
          MenuItemModel(
            id: 'khrua_bangkok_old_2',
            name: 'Guay Tiew Reua',
            price: 109,
            image: 'assets/images/food-container.png',
            description: 'Boat noodles with pork, herbs and dark broth',
          ),
          MenuItemModel(
            id: 'khrua_bangkok_old_3',
            name: 'Khao Ka Moo',
            price: 129,
            image: 'assets/images/food-container (1).png',
            description: 'Stewed pork leg on rice with pickled vegetables',
          ),
          MenuItemModel(
            id: 'khrua_bangkok_old_4',
            name: 'Bamee Haeng Moo Daeng',
            price: 89,
            image: 'assets/images/food-container.png',
            description: 'Egg noodles with red barbecue pork and wonton',
          ),
          MenuItemModel(
            id: 'khrua_bangkok_old_5',
            name: 'Khao Pad Grapao Kai Dao',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description:
                'Stir-fried rice with holy basil, minced pork and fried egg',
          ),
        ],
      ),
      RestaurantModel(
        id: 'krua_southern_phat',
        name: 'Krua Southern Phat',
        rating: 4.6,
        deliveryTime: 35,
        distance: 3.6,
        imagePath: 'assets/images/restaurant (6).png',
        menu: [
          MenuItemModel(
            id: 'krua_southern_phat_1',
            name: 'Gaeng Tai Pla',
            price: 139,
            image: 'assets/images/food-container (1).png',
            description:
                'Spicy southern curry with fish innards and vegetables',
          ),
          MenuItemModel(
            id: 'krua_southern_phat_2',
            name: 'Khua Kling Moo',
            price: 129,
            image: 'assets/images/food-container.png',
            description: 'Dry fried minced pork with southern curry paste',
          ),
          MenuItemModel(
            id: 'krua_southern_phat_3',
            name: 'Pad Sataw Goong',
            price: 159,
            image: 'assets/images/food-container (1).png',
            description: 'Stir-fried stink beans with prawns and chili paste',
          ),
          MenuItemModel(
            id: 'krua_southern_phat_4',
            name: 'Gaeng Som Pak Tai',
            price: 119,
            image: 'assets/images/food-container.png',
            description: 'Southern sour curry with fish and mixed vegetables',
          ),
          MenuItemModel(
            id: 'krua_southern_phat_5',
            name: 'Nam Prik Kapi Pla Tu',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description:
                'Shrimp paste dip with fried mackerel and fresh vegetables',
          ),
        ],
      ),
      RestaurantModel(
        id: 'pla_pao_rim_khlong',
        name: 'Pla Pao Rim Khlong',
        rating: 4.4,
        deliveryTime: 40,
        distance: 3.2,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'pla_pao_rim_khlong_1',
            name: 'Pla Pao Kleua',
            price: 249,
            image: 'assets/images/food-container (1).png',
            description: 'Salt-crusted grilled fish with herbs',
          ),
          MenuItemModel(
            id: 'pla_pao_rim_khlong_2',
            name: 'Pla Tod Nam Pla',
            price: 199,
            image: 'assets/images/food-container.png',
            description: 'Deep-fried fish with fish sauce and herbs',
          ),
          MenuItemModel(
            id: 'pla_pao_rim_khlong_3',
            name: 'Tom Yum Pla',
            price: 169,
            image: 'assets/images/food-container (1).png',
            description: 'Spicy and sour fish soup with Thai herbs',
          ),
          MenuItemModel(
            id: 'pla_pao_rim_khlong_4',
            name: 'Pla Rad Prik',
            price: 219,
            image: 'assets/images/food-container.png',
            description:
                'Deep-fried fish topped with spicy sweet and sour sauce',
          ),
          MenuItemModel(
            id: 'pla_pao_rim_khlong_5',
            name: 'Yam Pla Dook Foo',
            price: 149,
            image: 'assets/images/food-container (1).png',
            description: 'Crispy catfish flakes salad with green mango',
          ),
        ],
      ),
      RestaurantModel(
        id: 'chan_khao_gaeng',
        name: 'Chan Khao Gaeng',
        rating: 4.7,
        deliveryTime: 25,
        distance: 2.4,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'chan_khao_gaeng_1',
            name: 'Gaeng Keow Wan Gai',
            price: 109,
            image: 'assets/images/food-container (1).png',
            description: 'Green curry with chicken, eggplant and sweet basil',
          ),
          MenuItemModel(
            id: 'chan_khao_gaeng_2',
            name: 'Gaeng Panaeng Nuea',
            price: 129,
            image: 'assets/images/food-container.png',
            description: 'Thick red curry with beef and kaffir lime leaves',
          ),
          MenuItemModel(
            id: 'chan_khao_gaeng_3',
            name: 'Gaeng Massaman Gai',
            price: 119,
            image: 'assets/images/food-container (1).png',
            description:
                'Sweet and savory curry with chicken, potatoes and peanuts',
          ),
          MenuItemModel(
            id: 'chan_khao_gaeng_4',
            name: 'Pad Prik King Moo Grob',
            price: 139,
            image: 'assets/images/food-container.png',
            description:
                'Stir-fried crispy pork belly with red curry paste and string beans',
          ),
          MenuItemModel(
            id: 'chan_khao_gaeng_5',
            name: 'Gaeng Som Pak Ruam',
            price: 99,
            image: 'assets/images/food-container (1).png',
            description: 'Sour vegetable curry with mixed vegetables',
          ),
        ],
      ),
      RestaurantModel(
        id: 'rim_tang_kanom_thai',
        name: 'Rim Tang Kanom Thai',
        rating: 4.5,
        deliveryTime: 20,
        distance: 2.3,
        imagePath: 'assets/images/restaurant (6).png',
        menu: [
          MenuItemModel(
            id: 'rim_tang_kanom_thai_1',
            name: 'Khanom Krok',
            price: 69,
            image: 'assets/images/food-container (1).png',
            description: 'Coconut rice pancakes with various toppings',
          ),
          MenuItemModel(
            id: 'rim_tang_kanom_thai_2',
            name: 'Khanom Bueang',
            price: 79,
            image: 'assets/images/food-container.png',
            description: 'Thai crispy crepes with sweet or savory fillings',
          ),
          MenuItemModel(
            id: 'rim_tang_kanom_thai_3',
            name: 'Sangkhaya Fak Thong',
            price: 89,
            image: 'assets/images/food-container (1).png',
            description: 'Pumpkin custard with coconut cream',
          ),
          MenuItemModel(
            id: 'rim_tang_kanom_thai_4',
            name: 'Mango Sticky Rice',
            price: 99,
            image: 'assets/images/food-container.png',
            description:
                'Sweet glutinous rice with fresh mango and coconut milk',
          ),
          MenuItemModel(
            id: 'rim_tang_kanom_thai_5',
            name: 'Tub Tim Grob',
            price: 69,
            image: 'assets/images/food-container (1).png',
            description:
                'Water chestnut rubies in coconut milk with crushed ice',
          ),
        ],
      ),
      RestaurantModel(
        id: 'roi_krew_thai',
        name: 'Roi Krew Thai',
        rating: 4.7,
        deliveryTime: 35,
        distance: 3.1,
        imagePath: 'assets/images/restaurant (5).png',
        menu: [
          MenuItemModel(
            id: 'roi_krew_thai_1',
            name: 'Yam Woon Sen',
            price: 109,
            image: 'assets/images/food-container (1).png',
            description: 'Glass noodle salad with seafood and herbs',
          ),
          MenuItemModel(
            id: 'roi_krew_thai_2',
            name: 'Mieng Kham',
            price: 99,
            image: 'assets/images/food-container.png',
            description:
                'Leaf-wrapped bites with coconut, ginger, lime and peanuts',
          ),
          MenuItemModel(
            id: 'roi_krew_thai_3',
            name: 'Pla Goong',
            price: 159,
            image: 'assets/images/food-container (1).png',
            description: 'Spicy prawn salad with lemongrass and mint',
          ),
          MenuItemModel(
            id: 'roi_krew_thai_4',
            name: 'Yam Mamuang',
            price: 89,
            image: 'assets/images/food-container.png',
            description: 'Spicy green mango salad with dried shrimp',
          ),
          MenuItemModel(
            id: 'roi_krew_thai_5',
            name: 'Yam Talay',
            price: 179,
            image: 'assets/images/food-container (1).png',
            description: 'Spicy mixed seafood salad with Thai herbs',
          ),
        ],
      ),
      RestaurantModel(
        id: 'cha_nom_baan_rai',
        name: 'Cha Nom Baan Rai',
        rating: 4.4,
        deliveryTime: 15,
        distance: 1.9,
        imagePath: 'assets/images/restaurant (1).png',
        menu: [
          MenuItemModel(
            id: 'cha_nom_baan_rai_1',
            name: 'Thai Milk Tea',
            price: 59,
            image: 'assets/images/food-container (1).png',
            description: 'Sweet and creamy traditional Thai iced tea',
          ),
          MenuItemModel(
            id: 'cha_nom_baan_rai_2',
            name: 'Thai Lemon Tea',
            price: 49,
            image: 'assets/images/food-container.png',
            description: 'Refreshing iced tea with fresh lime',
          ),
          MenuItemModel(
            id: 'cha_nom_baan_rai_3',
            name: 'Butterfly Pea Milk',
            price: 69,
            image: 'assets/images/food-container (1).png',
            description: 'Blue butterfly pea tea with milk and honey',
          ),
          MenuItemModel(
            id: 'cha_nom_baan_rai_4',
            name: 'Longan Juice',
            price: 59,
            image: 'assets/images/food-container.png',
            description: 'Sweet longan fruit juice with honey',
          ),
          MenuItemModel(
            id: 'cha_nom_baan_rai_5',
            name: 'Thai Coffee',
            price: 65,
            image: 'assets/images/food-container (1).png',
            description: 'Strong Thai coffee with condensed milk',
          ),
        ],
      ),
    ];
  }

  static RestaurantModel? getRestaurantById(String id) {
    try {
      return getRestaurants().firstWhere((restaurant) => restaurant.id == id);
    } catch (e) {
      return null;
    }
  }
}
