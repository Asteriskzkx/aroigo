import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aroigo/model/menu_model.dart';

class DynamicMenuCustomizationScreen extends StatefulWidget {
  final MenuItemModel menuItem;
  final Map<String, dynamic> customizationOptions;
  final Function(MenuItemModel, Map<String, dynamic>) onAddToCart;

  const DynamicMenuCustomizationScreen({
    super.key,
    required this.menuItem,
    required this.customizationOptions,
    required this.onAddToCart,
  });

  @override
  State<StatefulWidget> createState() {
    return _DynamicMenuCustomizationScreenState();
  }
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

    if (widget.customizationOptions.containsKey('categories')) {
      final categories = widget.customizationOptions['categories'] as List;

      for (final category in categories) {
        final categoryName = category['name'] as String;
        final allowMultiple = category['allowMultiple'] as bool;
        final minSelections = category['minSelections'] as int? ?? 0;
        final maxSelections =
            category['maxSelections'] as int? ?? (allowMultiple ? 999 : 1);

        _selections[categoryName] = {};

        _multipleSelectionsAllowed[categoryName] = allowMultiple;

        _selectionLimits[categoryName] = {
          'min': minSelections,
          'max': maxSelections,
        };
      }
    }
  }

  double get totalPrice => _basePrice + _additionalPrice;

  void _updateAdditionalPrice() {
    double newAdditionalPrice = 0;

    if (widget.customizationOptions.containsKey('categories')) {
      final categories = widget.customizationOptions['categories'] as List;

      for (final category in categories) {
        final categoryName = category['name'] as String;
        final options = category['options'] as List;

        final selectedOptions = _selections[categoryName] ?? {};

        for (final option in options) {
          final optionName = option['name'] as String;

          if (selectedOptions.contains(optionName)) {
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

  void _handleOptionSelection(
    String categoryName,
    String optionName,
    bool isSelected,
  ) {
    setState(() {
      final selectedOptions = _selections[categoryName] ?? {};

      final allowMultiple = _multipleSelectionsAllowed[categoryName] ?? false;

      final maxSelections = _selectionLimits[categoryName]?['max'] ?? 1;

      if (isSelected) {
        if (!allowMultiple) {
          selectedOptions.clear();
        } else if (selectedOptions.length >= maxSelections) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Maximum $maxSelections selections allowed for this category',
                style: TextStyle(fontFamily: 'SF Pro Display'),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }

        selectedOptions.add(optionName);
      } else {
        selectedOptions.remove(optionName);
      }

      _selections[categoryName] = selectedOptions;
    });

    _updateAdditionalPrice();
  }

  bool _validateSelections() {
    bool isValid = true;
    String errorMessage = '';

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

  Map<String, dynamic> _getCustomizationResults() {
    final Map<String, dynamic> result = {};

    _selections.forEach((categoryName, selections) {
      result[categoryName.toLowerCase().replaceAll(' ', '_')] =
          selections.toList();
    });

    if (_noteController.text.isNotEmpty) {
      result['note'] = _noteController.text;
    }

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
                  Text(
                    widget.menuItem.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                  const SizedBox(height: 24),

                  if (widget.customizationOptions.containsKey('categories'))
                    ..._buildCategories(),

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
              color: Colors.grey.withAlpha((0.3 * 255).toInt()),
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

                if (!_validateSelections()) {
                  return;
                }

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
