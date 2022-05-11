import 'package:flutter/material.dart';
import 'package:news_app/news_model.dart';

class DetailNews extends StatefulWidget {
  DetailNews({required this.article});
  Article article;

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  bool _pinned = true;

  bool _snap = false;

  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: Image.network(
                widget.article.urlToImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        widget.article.content!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                      child: Text(widget.article.description!),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                              '${widget.article.publishedAt?.day}.${widget.article.publishedAt?.month}.${widget.article.publishedAt?.year}'),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Author: ${widget.article.author ?? 'unknown'}'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 20),
          //         child: Column(
          //           children: [
          //             Container(
          //               child: Center(
          //                 child: Text(
          //                   widget.article.content!,
          //                   style: TextStyle(fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Container(
          //               child: Center(
          //                 child: Text(widget.article.description!),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 50,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Container(
          //                   child: Center(
          //                     child: Text(
          //                         '${widget.article.publishedAt?.day}.${widget.article.publishedAt?.month}.${widget.article.publishedAt?.year}'),
          //                   ),
          //                 ),
          //                 Container(
          //                   child: Center(
          //                     child: Text('Author: ${widget.article.author ?? 'unknown'}'),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //     childCount: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
