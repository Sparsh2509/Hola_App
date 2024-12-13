import 'dart:convert';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/models/homepage_model.dart';
import 'package:http/http.dart';

class PostServices {
  Future<String> getHomePagePosts() async {
    try {
      Response response = await get(
          Uri.parse("https://snapverse-6nqx.onrender.com/posts"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (var item in data['posts']) {
          print(item.toString());
          if (item['image'] == null) {
          } else {
            homePagePosts.add(HomepageModel(
                image: item['image']['url'],
                userName: item['user']['name'],
                caption: item['caption'],
                imageUrl: item['user']['profileImage']['url'],
                likes: item['likesCount'],
                comments: item['commentsCount'],
                isliked: false));
          }
        }
        print("home Page posts length = " + homePagePosts.length.toString());
        return "Posts Fetched";
      }
    } catch (e) {
      throw "Posts not fetched";
    }
    throw "Posts not fetched";
  }


  Future<String> getExplorePagePosts() async {
    try {
      Response response = await get(
        
          Uri.parse("https://snapverse-6nqx.onrender.com/posts"),
          headers: Map<String, String>.from({"cookie": loggedInUser!.token}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (var item in data['posts']) {
          print(item.toString());
          if (item['image'] == null) {
          } else {
            explorePagePosts.add(HomepageModel(
                image: item['image']['url'],
                userName: item['user']['name'],
                caption: item['caption'],
                imageUrl: item['user']['profileImage']['url'],
                likes: item['likesCount'],
                comments: item['commentsCount'],
                isliked: false));
          }
        }
        print("home Page posts length = " + homePagePosts.length.toString());
        return "Posts Fetched";
      }
    } catch (e) {
      throw "Posts not fetched";
    }
    throw "Posts not fetched";
  }

}
