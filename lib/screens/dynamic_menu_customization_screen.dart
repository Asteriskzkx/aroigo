import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aroigo/model/menu_model.dart';

class DynamicMenuCustomizationScreen extends StatefulWidget {
  final MenuItemModel menuItem;
  final Map<String, dynamic> customizationOptions;
  final Function(MenuItemModel, Map<String, dynamic>) onAddToCart;

  const DynamicMenuCustomizationScreen({
    Key? key,
    required this.menuItem,
    required this.customizationOptions,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  _DynamicMenuCustomizationScreenState createState() =>
      _DynamicMenuCustomizationScreenState();
}

class _DynamicMenuCustomizationScreenState
    extends State<DynamicMenuCustomizationScreen> {
  final Map<String, Set<String>> _selections = {};

  final Map<String, bool> _multipleSelectionsAllowed = {};

  final Map<String, Map<String, int>> _selectionLimits = {};

  double _basePrice = 0;
  double _additionalPrice = 0;

  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _basePrice = widget.menuItem.price;

    // Initialize selection tracking for each category
    if (widget.customizationOptions.containsKey('categories')) {
      final categories = widget.customizationOptions['categories'] as List;

      for (final category in categories) {
        final categoryName = category['name'] as String;
        final allowMultiple = category['allowMultiple'] as bool;
        final minSelections = category['minSelections'] as int? ?? 0;
        final maxSelections =
            category['maxSelections'] as int? ?? (allowMultiple ? 999 : 1);

        // Initialize empty selection set
        _selections[categoryName] = {};

        // Track multiple selection setting
        _multipleSelectionsAllowed[categoryName] = allowMultiple;

        // Track selection limits
        _selectionLimits[categoryName] = {
          'min': minSelections,
          'max': maxSelections,
        };
      }
    }
  }

  double get totalPrice => _basePrice + _additionalPrice;

  // Update additional price based on all selections
  void _updateAdditionalPrice() {
    double newAdditionalPrice = 0;

    if (widget.customizationOptions.containsKey('categories')) {
      final categories = widget.customizationOptions['categories'] as List;

      for (final category in categories) {
        final categoryName = category['name'] as String;
        final options = category['options'] as List;

        // Get all selected options for this category
        final selectedOptions = _selections[categoryName] ?? {};

        // Add price for each selected option
        for (final option in options) {
          final optionName = option['name'] as String;

          if (selectedOptions.contains(optionName)) {
            // Add the price for this option
            final additionalPrice =
                option['additionalPrice']?.toDouble() ?? 0.0;
            newAdditionalPrice += additionalPrice;
          }
        }
      }
    }

    setState(() {
      _additionalPrice = newAdditionalPrice;
    });
  }

  // Handle option selection/deselection
  void _handleOptionSelection(
    String categoryName,
    String optionName,
    bool isSelected,
  ) {
    setState(() {
      // Get current selections for this category
      final selectedOptions = _selections[categoryName] ?? {};

      // Check if multiple selections are allowed
      final allowMultiple = _multipleSelectionsAllowed[categoryName] ?? false;

      // Get max selections for this category
      final maxSelections = _selectionLimits[categoryName]?['max'] ?? 1;

      if (isSelected) {
        // If selecting an option
        if (!allowMultiple) {
          // For single selection categories, clear previous selection
          selectedOptions.clear();
        } else if (selectedOptions.length >= maxSelections) {
          // If already at max selections, show message and return
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Maximum ${maxSelections} selections allowed for this category',
                style: TextStyle(fontFamily: 'SF Pro Display'),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }

        // Add the new selection
        selectedOptions.add(optionName);
      } else {
        // If deselecting, just remove the option
        selectedOptions.remove(optionName);
      }

      // Update the selections map
      _selections[categoryName] = selectedOptions;
    });

    // Update price after selection changes
    _updateAdditionalPrice();
  }

  // Validate that all required selections are made
  bool _validateSelections() {
    bool isValid = true;
    String errorMessage = '';

    // Check each category
    _selectionLimits.forEach((categoryName, limits) {
      final minRequired = limits['min'] ?? 0;
      final selected = _selections[categoryName]?.length ?? 0;

      if (selected < minRequired) {
        isValid = false;
        if (errorMessage.isEmpty) {
          errorMessage =
              'Please select at least $minRequired option(s) for $categoryName';
        }
      }
    });

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: TextStyle(fontFamily: 'SF Pro Display'),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return isValid;
  }

  // Prepare selections as a map to pass back to the parent widget
  Map<String, dynamic> _getCustomizationResults() {
    // Convert sets to lists for easier handling
    final Map<String, dynamic> result = {};

    _selections.forEach((categoryName, selections) {
      // For categories with multiple selections, store as list
      result[categoryName.toLowerCase().replaceAll(' ', '_')] =
          selections.toList();
    });

    // Add note to restaurant if provided
    if (_noteController.text.isNotEmpty) {
      result['note'] = _noteController.text;
    }

    // Add price information
    result['additionalPrice'] = _additionalPrice;
    result['totalPrice'] = totalPrice;

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.menuItem.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFF6B35),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Menu item image and details
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                image: AssetImage(widget.menuItem.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dish description
                  Text(
                    widget.menuItem.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Build customization categories dynamically
                  if (widget.customizationOptions.containsKey('categories'))
                    ..._buildCategories(),

                  // Note to restaurant - common for all items
                  _buildSectionTitle('Note to restaurant', 'Optional'),
                  TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Add your request',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                    maxLines: 2,
                  ),

                  // Spacing for bottom button
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${totalPrice.toStringAsFixed(0)} ฿',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6B35),
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  if (_additionalPrice > 0)
                    Text(
                      '+${_additionalPrice.toStringAsFixed(0)} ฿ with selections',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                HapticFeedback.mediumImpact();

                // Validate all required selections are made
                if (!_validateSelections()) {
                  return;
                }

                // Add to cart and close the screen
                widget.onAddToCart(widget.menuItem, _getCustomizationResults());
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add to Basket',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build all customization categories
  List<Widget> _buildCategories() {
    final List<Widget> categories = [];
    final categoriesList = widget.customizationOptions['categories'] as List;

    for (final category in categoriesList) {
      final categoryName = category['name'] as String;
      final description = category['description'] as String;
      final options = category['options'] as List;

      categories.add(_buildSectionTitle(categoryName, description));
      categories.add(_buildOptionsGroup(categoryName, options));
      categories.add(const SizedBox(height: 24));
    }

    return categories;
  }

  // Build a single category of options
  Widget _buildOptionsGroup(String categoryName, List options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          options.map<Widget>((option) {
            final optionName = option['name'] as String;
            final additionalPrice =
                option['additionalPrice']?.toDouble() ?? 0.0;
            final isSelected = (_selections[categoryName] ?? {}).contains(
              optionName,
            );

            return CheckboxListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    optionName,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                    ),
                  ),
                  if (additionalPrice > 0)
                    Text(
                      '+${additionalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 14,
                        color: Color(0xFFFF6B35),
                      ),
                    ),
                ],
              ),
              value: isSelected,
              onChanged: (bool? value) {
                _handleOptionSelection(
                  categoryName,
                  optionName,
                  value ?? false,
                );
              },
              activeColor: const Color(0xFFFF6B35),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
            );
          }).toList(),
    );
  }

  // Helper widget to build section titles
  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Display',
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '($subtitle)',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontFamily: 'SF Pro Display',
            ),
          ),
        ],
      ),
    );
  }
}
