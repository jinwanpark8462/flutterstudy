import 'package:flutter/material.dart';
import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_model.dart';
import 'package:fproject/%EC%84%9C%EB%B9%84%EC%8A%A4/api_service.dart';
import 'package:fproject/%EC%9C%84%EC%A0%AF/webtoon_widget.dart';

class homescreen extends StatelessWidget {
  homescreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        toolbarHeight: 130,
        centerTitle: true,
        forceMaterialTransparency: true,
        elevation: 0,
        backgroundColor: Colors.white30,
        foregroundColor: Colors.black,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Expanded(child: makelist(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makelist(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        itemBuilder: (context, index) {
          var webtoon = snapshot.data![index];
          return Webtoon(
            id: webtoon.id,
            thumb: webtoon.thumb,
            title: webtoon.title,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 40,
            ));
  }
}
