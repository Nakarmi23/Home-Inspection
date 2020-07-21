import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/inspection_file_info.dart';

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
    return CubitBuilder<InspectionFileInfoCubit, InspectionFileInfoState>(
        builder: (context, state) {
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
            CubitBuilder<InspectionFileInfoCubit, InspectionFileInfoState>(
              builder: (context, state) {
                if (state is InspectionFileInfoSuccess) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                        leading: Column(
                          children: <Widget>[
                            Text(
                              index.toString(),
                            ),
                          ],
                        ),
                        title: Text(state.inspectionFileInfos[index].name),
                        subtitle:
                            Text(state.inspectionFileInfos[index].address),
                      );
                    }, childCount: state.inspectionFileInfos.length),
                  );
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
