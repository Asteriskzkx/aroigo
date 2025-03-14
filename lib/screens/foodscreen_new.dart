import 'package:aroigo/widgets/categorytogglebutton.dart';
import 'package:aroigo/widgets/togglebutton.dart';
import 'package:flutter/material.dart';

class FoodscreenNew extends StatefulWidget {
  const FoodscreenNew({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FoodscreenNew();
  }
}

class _FoodscreenNew extends State<FoodscreenNew> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 124.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0XFFFF6B35), const Color(0XFFFF8C5A)],
                    stops: const [0.3, 0.7],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "DELIVER TO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Home",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          // labelText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              titlePadding: EdgeInsets.zero,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Togglebutton(),
                      ),
                      const SizedBox(height: 6),
                      Categorytogglebutton(),
                    ],
                  );
                }
                // final itemText = 'Item ${index - 1}';
                // if (_searchText.isEmpty ||
                //     itemText.toLowerCase().contains(
                //       _searchText.toLowerCase(),
                //     )) {
                //   return ListTile(title: Text(itemText));
                // } else {
                //   return const SizedBox.shrink();
                // }
              },
              // childCount:
              //     101,
            ),
          ),
        ],
      ),
    );
  }
}
