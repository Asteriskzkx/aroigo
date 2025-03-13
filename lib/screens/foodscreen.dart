import 'package:flutter/material.dart';

class Foodscreen extends StatefulWidget {
  const Foodscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Foodscreen();
  }
}

class _Foodscreen extends State<Foodscreen> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _isCollapsed = scrollNotification.metrics.pixels > 1;
            });
          }
          return true;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor:
                  _isCollapsed
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : null,
              leadingWidth: 56,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: _isCollapsed ? Colors.black : Colors.white,
                ),
              ),
              title:
                  _isCollapsed
                      ? TextField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "What shall we deliver?",
                          hintStyle: const TextStyle(
                            color: Color(0XFF707070),
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )
                      : null,
              flexibleSpace:
                  _isCollapsed
                      ? null
                      : FlexibleSpaceBar(
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0XFFFF6B35), Color(0XFFFF8C5A)],
                              stops: [0.3, 0.7],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 56,
                                  top: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "DELIVER TO",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 4,
                                  bottom: 12,
                                ),
                                child: TextField(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    hintText: "What shall we deliver?",
                                    hintStyle: const TextStyle(
                                      color: Color(0XFF707070),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Item $index"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
