import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/home_inspection_cubit/home_inspection_cubit.dart';
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
  bool shouldListen = true;
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
            onPressed: () async {
              shouldListen = false;
              await Navigator.of(context).pushNamed('/inspectionForm');
              shouldListen = true;
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
              CubitListener<HomeInspectionCubit, HomeInspectionState>(
                listener: (context, state) async {
                  if (state is HomeInspectionSuccess) {
                    shouldListen = false;
                    await Navigator.of(context)
                        .pushNamed('/inspectionForm', arguments: true);
                    shouldListen = true;
                  }
                },
                listenWhen: (previous, current) {
                  return shouldListen;
                },
                child: CubitBuilder<InspectionFileInfoCubit,
                    InspectionFileInfoState>(
                  builder: (context, state) {
                    if (state is InspectionFileInfoSuccess) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index.isOdd) {
                              return Divider(
                                height: 0,
                                indent: (32.0 * 2),
                              );
                            }
                            return ListTile(
                              onTap: () async {
                                context.cubit<HomeInspectionCubit>().readData(
                                    state.inspectionFileInfos[index ~/ 2]
                                        .fileName);
                              },
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    (index ~/ 2).toString(),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              title: Text(
                                  state.inspectionFileInfos[index ~/ 2].name),
                              subtitle: Text(state
                                  .inspectionFileInfos[index ~/ 2].address),
                            );
                          },
                          childCount:
                              (state.inspectionFileInfos.length * 2) - 1,
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
