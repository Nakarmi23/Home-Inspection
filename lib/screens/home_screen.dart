import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  bool isFABExtended = true;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset == 0) {
          setState(() {
            isFABExtended = true;
          });
        } else {
          setState(() {
            isFABExtended = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        tooltip: 'Create New Inspection',
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {},
              )
            ],
            floating: true,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20, bottom: 20),
              title: Text('House Inspection List'),
            ),
            expandedHeight: kToolbarHeight * 2,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, inedx) {
                return ListTile(
                  title: Text('index.toString()'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
      // body: ListView.builder(
      //     controller: _scrollController,
      //     itemCount: 20,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(
      //           index.toString(),
      //         ),
      //       );
      //     }),
    );
  }
}
