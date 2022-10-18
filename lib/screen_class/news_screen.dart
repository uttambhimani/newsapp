import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:newsapp/model_class/NewsModel.dart';
import 'package:newsapp/Providerclass/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({Key? key}) : super(key: key);

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {
  int likecount =78;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 10,),
            SizedBox(height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Button("apple"),
                  Button("google"),
                  Button("india"),
                  Button("cricket"),
                  Button("health"),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: FutureBuilder<NewsModel>(
                future: Provider.of<HomeProvider>(context, listen: false)
                    .apicalling(Provider
                    .of<HomeProvider>(context, listen: true)
                    .SearchData),
                builder: (context, snepshot) {
                  if (snepshot.hasError) {
                    return Text("${snepshot.error}");
                  } else if (snepshot.hasData) {
                    NewsModel newsModel = snepshot.data!;
                    return ListView.builder(
                        itemCount: newsModel.articles!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){

                              Provider.of<HomeProvider>(context,listen: false).alldatalist=newsModel.articles![index];
                              Navigator.pushNamed(context, 'st');

                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 250,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: "${newsModel.articles![index]
                                          .urlToImage}",
                                      height: 125,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder: (context, _) =>
                                          Image.asset("assets/news.jpg"),
                                      errorWidget: (context, _, __) =>
                                          Image.asset("assets/news.jpg"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        "${newsModel.articles![index].title}",
                                        overflow: TextOverflow.ellipsis),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "${newsModel.articles![index]
                                            .description}",
                                        overflow: TextOverflow.ellipsis),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LikeButton(
                                           likeCount: likecount,
                                         isLiked: isLiked,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Shimmer.fromColors(
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                            color: Colors.black,)
                            ));
                          }
                          ),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(String name) {
    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).changData(name);
      },
      child: Container(
        height: 30,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Text(
          "$name",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black38,
        ),
      ),
    );
  }
}
