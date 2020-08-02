import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/components/delete_item_dialog.dart';
import 'package:house_review/components/dismissible_background.dart';
import 'package:house_review/cubit/home_inspection_cubit/home_inspection_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
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
          appBar: AppBar(
            title: Text('House Inspection'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {},
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              shouldListen = false;
              await Navigator.of(context).pushNamed('/inspectionForm');
              shouldListen = true;
            },
            child: Icon(Icons.add),
            tooltip: 'Create New Inspection',
          ),
          body: CubitListener<HomeInspectionCubit, HomeInspectionState>(
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
            child: Builder(
              builder: (context) {
                if (state is InspectionFileInfoInProcess) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is InspectionFileInfoSuccess) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: DismissibleBackground(
                          color: Theme.of(context).errorColor,
                          forDirection: DismissDirection.endToStart,
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        key: UniqueKey(),
                        confirmDismiss: (direction) async {
                          bool isConfirm = await deleteItemAlertModel(context);
                          return isConfirm;
                        },
                        onDismissed: (direction) {
                          context
                              .cubit<InspectionFileInfoCubit>()
                              .deleteData(state.inspectionFileInfos[index]);
                        },
                        child: ListTile(
                          onTap: () async {
                            context.cubit<HomeInspectionCubit>().readData(
                                state.inspectionFileInfos[index].fileName);
                          },
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                (index).toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                          title: Text(state.inspectionFileInfos[index].name),
                          subtitle:
                              Text(state.inspectionFileInfos[index].address),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        indent: (32.0 * 2),
                      );
                    },
                    itemCount: state.inspectionFileInfos.length,
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
