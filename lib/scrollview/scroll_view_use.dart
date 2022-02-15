import 'package:flutter/material.dart';

class YXCUseCustomScrollView extends StatelessWidget {
  const YXCUseCustomScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CustomScrollView",
          style: TextStyle(color: Colors.black),
        ),
        // elevation: 0,
        // backgroundColor: Colors.transparent,
      ),
      body: const _YXCUserCustomScrollBodyView(),
    );
  }
}

class _YXCUserCustomScrollBodyView extends StatelessWidget {
  const _YXCUserCustomScrollBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            "SliverAppBar",
            style: TextStyle(fontSize: 15, color: Colors.purpleAccent),
          ),
          backgroundColor: Colors.orangeAccent,
          automaticallyImplyLeading: false,
          expandedHeight: 88,
          floating: true,
          // pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.deepPurple,
            ),
            title: const Text("FlexibleSpaceBar"),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.red,
                height: 100.0,
              ),
              Container(
                color: Colors.deepPurpleAccent,
                height: 100.0,
              ),
              Container(
                color: Colors.green,
                height: 100.0,
              ),
              Container(
                color: Colors.indigo,
                height: 100,
              )
            ],
          ),
        ),
        SliverPersistentHeader(
          delegate: _YXCSliverHeaderDelegate(),
          // 设置悬停状态
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: Text(
                  "Orange $index",
                ),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}

class _YXCSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 44,
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "SectionHeader",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 44;

  @override
  double get minExtent => 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
