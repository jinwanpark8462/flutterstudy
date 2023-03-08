import 'package:flutter/material.dart';
import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_detail.dart';
import 'package:fproject/%EB%AA%A8%EB%8D%B8/webtoon_episode_model.dart';
import 'package:fproject/%EC%84%9C%EB%B9%84%EC%8A%A4/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.id,
    required this.thumb,
    required this.title,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Webtoondetail> webtoon;
  late Future<List<webtoonepisode>> episodes;

  void initstate() {
    super.initState();
    webtoon = ApiService.getToonbyid(widget.id);
    episodes = ApiService.getLatestEpisodebyid(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        toolbarHeight: 140,
        forceMaterialTransparency: true,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white30,
        foregroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.id,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ]),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  widget.thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                ),
              ),
            ),
          ],
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.about);
            }
            return const Text('....');
          },
        )
      ]),
    );
  }
}
