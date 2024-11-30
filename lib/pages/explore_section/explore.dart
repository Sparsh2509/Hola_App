import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/explore_section/accounts.dart';
import 'package:hola_app/pages/explore_section/community.dart';
import 'package:hola_app/pages/explore_section/tags.dart';
import 'package:hola_app/pages/explore_section/tops.dart';
import 'package:hola_app/pages/follow_section/following.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  List<String> tagType = [
    "Tops",
    "Accounts",
    "Tags",
    "Community"
  ];
  int selectedTagType = 0;
  int selectedIndex = 0;


  _updateIndex(int i){
    setState(() {
      selectedIndex = i;
    });
  }

  _getBody(){
    switch (selectedIndex){
      case 0: return const Tops();
      case 1: return Accounts();
      case 2: return const Tags();
      case 3: return const Community();

    }
  }
  
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
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "Trending",style: TextStyle(
                      fontSize: 20

                    ),
                  ),
                ),
                Tab(child: Text(
                    "Community",style: TextStyle(
                      fontSize: 20

                    ),
                  ),),

              ],
            ),
            SizedBox(
              height: screenHeight*0.02
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
    return Column(
      children: [
        Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: screenHeight * 0.08,
              width: screenWidth,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTagType = index;
                          _updateIndex(index);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: screenHeight * 0.05,
                        // width: screenHeight*0.08,
                        decoration: BoxDecoration(
                            border: Border.all(color: iconColor),
                            borderRadius: BorderRadius.circular(15),
                            color: selectedTagType == index
                                ? iconColor
                                : whiteColor),
                        child: Text(
                          tagType[index],style: TextStyle(fontSize: 15,color: selectedTagType == index? whiteColor:iconColor,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: screenWidth * 0.06,
                );
              },
              itemCount: tagType.length),
        ),
        Expanded(
          child: Container(
            child: _getBody(),
            
            
          
          )
        )
      ],
    );
  }
}
