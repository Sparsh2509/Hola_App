import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            // Tab Bar
            TabBar(
              controller: _tabController,
              labelColor: iconColor,
              unselectedLabelColor: whiteColor,
              indicatorColor: iconColor,
              tabs: [
                Tab(text: "Trending"),
                Tab(text: "Community"),
              ],
            ),

            // Tab View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildTrendingView(),
                  buildCommunityView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 10, // Replace with dynamic count
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/post_image.png'), // Add your photo assets
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }

  Widget buildCommunityView() {
    return Center(
      child: Text("Community Content Here", style: TextStyle(fontSize: 18)),
    );
  }
}
