import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://dl.kaskus.id/cdn.cloudflare.steamstatic.com/apps/csgo/images/csgo_react/social/cs2.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-H8OhlbHvnFpZon_irlXdhvNVKjhnzpZqPg&s',
      'https://cdn1.epicgames.com/offer/fn/Blade_2560x1440_2560x1440-95718a8046a942675a0bc4d27560e2bb',
    ];

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.white, // Set background color
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child:
                            Image.network(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ))
                .toList(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: const Text(
              'Discover the ultimate gaming experience with sLeaM, your premier destination for the latest and greatest in gaming. Our app is designed to provide you with a seamless and enjoyable way to explore, purchase, and play the best games available. Whether you are a casual gamer or a hardcore enthusiast, sLeaM has something for everyone.',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}
