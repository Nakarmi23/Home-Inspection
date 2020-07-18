import 'package:flutter/material.dart';
import 'package:house_review/models/inspection_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  bool isFABExtended = true;
  List<InspectionData> _clientData = [];

  @override
  void didChangeDependencies() {}

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
        onPressed: () {
          Navigator.of(context).pushNamed('/inspectionForm');
        },
        child: Icon(Icons.add),
        tooltip: 'Create New Inspection',
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('House Inspection'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {},
              )
            ],
            floating: true,
            pinned: false,
            snap: false,
          ),
          // StreamBuilder<List<Client>>(
          //   stream: _bloc.client,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return SliverFillRemaining(
          //         child: Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     } else {
          //       if (!snapshot.hasData || snapshot.data.length == 0) {
          //         return SliverFillRemaining(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               Text(
          //                 'No Data to Display',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               RaisedButton(
          //                 onPressed: () {
          //                   _bloc.getClientData();
          //                 },
          //                 child: Text('Reload'),
          //                 color: Theme.of(context).primaryColor,
          //                 textColor: Colors.white,
          //               )
          //             ],
          //           ),
          //         );
          //       }
          //       _clientData.addAll(snapshot.data);
          //       return SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //           (context, index) {
          //             return ListTile(
          //               title: Text(_clientData[index].name),
          //             );
          //           },
          //           childCount: 0,
          //         ),
          //       );
          //     }
          //   },
          // ),
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
