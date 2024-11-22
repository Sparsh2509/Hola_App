// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/pages/comments.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeAppBarColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'hola\'',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.transparent,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Following'),
              ],
            ),
          ),
          // Posts List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostList(),
                _buildPostList(),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2A2A42),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: whiteColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Method to build list of posts
  Widget _buildPostList() {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return _buildPostCard();
      },
    );
  }

  // Method to build individual post card
  Widget _buildPostCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A42),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.purpleAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://marketplace.canva.com/EAFOWUXOOvs/1/0/1600w/canva-green-gradient-minimalist-simple-instagram-profile-picture-tBlf3wVYGhg.jpg',
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Alanna Myassa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Post Content
          const Text(
            'The Earth has music for those who listen #NatureLovers #Explore #WildlifePhotography #MotherNature #NaturePerfection',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          // Post Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToIZgsflyd1YiDYZDYAti86gBy31voZnPEwA&s",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          // Post Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.favorite_border, color: Colors.white),
                    onPressed: () {},
                  ),
                  const Text('1200', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Colors.white),
                    onPressed: () {
                       Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => CommentScreen()));
                    },
                  ),
                  const Text('193', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.graphic_eq, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
