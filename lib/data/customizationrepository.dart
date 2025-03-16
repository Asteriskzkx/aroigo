class CustomizationRepository {
  static Map<String, dynamic> getCustomizationOptions(String menuItemId) {
    final Map<String, dynamic> defaultCustomizations = {
      'categories': [
        {
          'name': 'Animal meat',
          'description': 'Pick at least 1',
          'allowMultiple': true,
          'minSelections': 1,
          'maxSelections': 10,
          'options': [
            {'name': 'Pork', 'additionalPrice': 0},
            {'name': 'Chicken', 'additionalPrice': 0},
            {'name': 'Minced pork', 'additionalPrice': 0},
            {'name': 'Pork liver', 'additionalPrice': 0},
            {'name': 'Pork + Minced pork', 'additionalPrice': 0},
            {'name': 'Pork roll', 'additionalPrice': 10},
            {'name': 'Sausage', 'additionalPrice': 10},
            {'name': 'Boar', 'additionalPrice': 10},
            {'name': 'Egg tofu', 'additionalPrice': 15},
            {'name': 'Meat', 'additionalPrice': 20},
            {'name': 'Minced meat', 'additionalPrice': 20},
            {'name': 'Crocodile meat', 'additionalPrice': 20},
            {'name': 'Squid', 'additionalPrice': 20},
            {'name': 'Shrimp', 'additionalPrice': 20},
          ],
        },
        {
          'name': 'Vegetable',
          'description': 'Pick at least 1',
          'allowMultiple': true,
          'minSelections': 1,
          'maxSelections': 10,
          'options': [
            {'name': 'No vegetable', 'additionalPrice': 0},
            {'name': 'Shredded bamboo shoots', 'additionalPrice': 0},
            {'name': 'Pickled bamboo shoots', 'additionalPrice': 0},
            {'name': 'Palm hearts', 'additionalPrice': 0},
            {'name': 'Green beans', 'additionalPrice': 0},
            {'name': 'Baby corn', 'additionalPrice': 0},
            {'name': 'Water spinach', 'additionalPrice': 0},
            {'name': 'Celery', 'additionalPrice': 0},
            {'name': 'Chinese cabbage', 'additionalPrice': 0},
            {'name': 'Kale', 'additionalPrice': 0},
            {'name': 'Baby Cabbage', 'additionalPrice': 0},
            {'name': 'Tomato', 'additionalPrice': 0},
            {'name': 'Carrot', 'additionalPrice': 0},
            {'name': 'Onion', 'additionalPrice': 0},
            {'name': 'Mushroom', 'additionalPrice': 0},
            {'name': 'Stink beans', 'additionalPrice': 0},
            {'name': 'Chinese chives', 'additionalPrice': 0},
          ],
        },
        {
          'name': 'Portion size',
          'description': 'Optional, max 1',
          'allowMultiple': false,
          'minSelections': 0,
          'maxSelections': 1,
          'options': [
            {'name': 'Special', 'additionalPrice': 20},
          ],
        },
        {
          'name': 'More topping',
          'description': 'Optional, max 1',
          'allowMultiple': false,
          'minSelections': 0,
          'maxSelections': 1,
          'options': [
            {'name': '1 Fried egg', 'additionalPrice': 15},
            {'name': '1 Omelet', 'additionalPrice': 15},
            {'name': '2 Omelets', 'additionalPrice': 30},
            {'name': 'Scrambled eggs', 'additionalPrice': 30},
          ],
        },
        {
          'name': 'Sauce',
          'description': 'Optional, max 3',
          'allowMultiple': true,
          'minSelections': 0,
          'maxSelections': 3,
          'options': [
            {'name': 'Prik Nam Pla', 'additionalPrice': 0},
            {'name': 'Chili sauce', 'additionalPrice': 0},
            {'name': 'Seasoning (chili, sugar, vinegar)', 'additionalPrice': 0},
          ],
        },
        {
          'name': 'Spoon and fork',
          'description': 'Optional, max 1',
          'allowMultiple': false,
          'minSelections': 0,
          'maxSelections': 1,
          'options': [
            {'name': 'Plastic spoon and fork', 'additionalPrice': 0},
          ],
        },
      ],
    };

    final Map<String, Map<String, dynamic>> customizationMap = {
      'burger_sabai_1': {
        'categories': [
          {
            'name': 'Protein',
            'description': 'Pick one',
            'allowMultiple': false,
            'minSelections': 1,
            'maxSelections': 1,
            'options': [
              {'name': 'Chicken', 'additionalPrice': 0},
              {'name': 'Pork', 'additionalPrice': 0},
              {'name': 'Tofu', 'additionalPrice': 0},
              {'name': 'Shrimp', 'additionalPrice': 20},
              {'name': 'Seafood mix', 'additionalPrice': 30},
            ],
          },
          {
            'name': 'Spice level',
            'description': 'Pick one',
            'allowMultiple': false,
            'minSelections': 1,
            'maxSelections': 1,
            'options': [
              {'name': 'Not spicy', 'additionalPrice': 0},
              {'name': 'Mild', 'additionalPrice': 0},
              {'name': 'Medium', 'additionalPrice': 0},
              {'name': 'Spicy', 'additionalPrice': 0},
              {'name': 'Thai spicy', 'additionalPrice': 0},
            ],
          },
          {
            'name': 'Extra',
            'description': 'Optional',
            'allowMultiple': true,
            'minSelections': 0,
            'maxSelections': 5,
            'options': [
              {'name': 'Extra bean sprouts', 'additionalPrice': 10},
              {'name': 'Extra peanuts', 'additionalPrice': 10},
              {'name': 'No bean sprouts', 'additionalPrice': 0},
              {'name': 'No peanuts', 'additionalPrice': 0},
              {'name': 'No dried shrimp', 'additionalPrice': 0},
              {'name': 'No egg', 'additionalPrice': 0},
            ],
          },
          {
            'name': 'Extra toppings',
            'description': 'Optional',
            'allowMultiple': true,
            'minSelections': 0,
            'maxSelections': 3,
            'options': [
              {'name': 'Fried egg', 'additionalPrice': 15},
              {'name': 'Extra lime', 'additionalPrice': 5},
              {'name': 'Crispy wonton', 'additionalPrice': 15},
            ],
          },
          {
            'name': 'Portion size',
            'description': 'Optional, max 1',
            'allowMultiple': false,
            'minSelections': 0,
            'maxSelections': 1,
            'options': [
              {'name': 'Special', 'additionalPrice': 20},
            ],
          },
          {
            'name': 'Spoon and fork',
            'description': 'Optional, max 1',
            'allowMultiple': false,
            'minSelections': 0,
            'maxSelections': 1,
            'options': [
              {'name': 'Plastic spoon and fork', 'additionalPrice': 0},
            ],
          },
        ],
      },

      'tom_yum_goong': {
        'categories': [
          {
            'name': 'Soup base',
            'description': 'Pick one',
            'allowMultiple': false,
            'minSelections': 1,
            'maxSelections': 1,
            'options': [
              {'name': 'Clear (Nam Sai)', 'additionalPrice': 0},
              {'name': 'Creamy (Nam Khon)', 'additionalPrice': 10},
            ],
          },
          {
            'name': 'Protein',
            'description': 'Pick at least 1',
            'allowMultiple': true,
            'minSelections': 1,
            'maxSelections': 3,
            'options': [
              {'name': 'Shrimp', 'additionalPrice': 0},
              {'name': 'Chicken', 'additionalPrice': 0},
              {'name': 'Seafood mix', 'additionalPrice': 20},
              {'name': 'Mushroom only', 'additionalPrice': 0},
            ],
          },
          {
            'name': 'Spice level',
            'description': 'Pick one',
            'allowMultiple': false,
            'minSelections': 1,
            'maxSelections': 1,
            'options': [
              {'name': 'Not spicy', 'additionalPrice': 0},
              {'name': 'Mild', 'additionalPrice': 0},
              {'name': 'Medium', 'additionalPrice': 0},
              {'name': 'Spicy', 'additionalPrice': 0},
              {'name': 'Thai spicy', 'additionalPrice': 0},
            ],
          },
          {
            'name': 'Portion size',
            'description': 'Optional, max 1',
            'allowMultiple': false,
            'minSelections': 0,
            'maxSelections': 1,
            'options': [
              {'name': 'Special', 'additionalPrice': 25},
            ],
          },
          {
            'name': 'Extra',
            'description': 'Optional',
            'allowMultiple': true,
            'minSelections': 0,
            'maxSelections': 5,
            'options': [
              {'name': 'Extra mushroom', 'additionalPrice': 10},
              {'name': 'No mushroom', 'additionalPrice': 0},
              {'name': 'No tomato', 'additionalPrice': 0},
              {'name': 'No cilantro', 'additionalPrice': 0},
              {'name': 'Extra lime', 'additionalPrice': 5},
            ],
          },
          {
            'name': 'Spoon and fork',
            'description': 'Optional, max 1',
            'allowMultiple': false,
            'minSelections': 0,
            'maxSelections': 1,
            'options': [
              {'name': 'Plastic spoon and fork', 'additionalPrice': 0},
            ],
          },
        ],
      },
    };

    return customizationMap[menuItemId] ?? defaultCustomizations;
  }
}
