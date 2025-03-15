import 'package:flutter/material.dart';

class FilterSorting extends StatelessWidget {
  final Function(String)? onFilterSelected;

  const FilterSorting({super.key, this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            _buildFilterButton(
              onTap: () => onFilterSelected?.call('filter'),
              child: const Icon(Icons.filter_list, size: 20),
            ),

            const SizedBox(width: 10),

            _buildFilterButton(
              onTap: () => onFilterSelected?.call('sort'),
              child: Row(
                children: const [
                  Icon(Icons.swap_vert, size: 20),
                  SizedBox(width: 4),
                  Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            _buildFilterButton(
              onTap: () => onFilterSelected?.call('promo'),
              child: const Text(
                'Promo',
                style: TextStyle(fontSize: 14, fontFamily: 'SF Pro Display'),
              ),
            ),

            const SizedBox(width: 10),

            _buildFilterButton(
              onTap: () => onFilterSelected?.call('delivery'),
              child: Row(
                children: const [
                  Icon(Icons.local_shipping, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'Delivery Fee',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            _buildFilterButton(
              onTap: () => onFilterSelected?.call('price'),
              child: const Text(
                'Price',
                style: TextStyle(fontSize: 14, fontFamily: 'SF Pro Display'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required VoidCallback onTap,
    required Widget child,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(25),
        ),
        child: child,
      ),
    );
  }
}
