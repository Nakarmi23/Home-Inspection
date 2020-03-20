import 'package:flutter/material.dart';

class HomeInspectionScreen extends StatefulWidget {
  HomeInspectionScreen({Key key}) : super(key: key);

  @override
  _HomeInspectionScreenState createState() => _HomeInspectionScreenState();
}

class _HomeInspectionScreenState extends State<HomeInspectionScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 300.0,
      floating: true,
      pinned: true,
      flexibleSpace: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(16),
            background: Image.network(
              'https://images.unsplash.com/photo-1475855581690-80accde3ae2b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
              fit: BoxFit.cover,
            ),
            title: Text(
              'Home Inspection Form',
            ),
          ),
          Positioned(
            bottom: -30,
            right: 16.0,
            child: SizedBox.fromSize(
              size: Size(60.0, 60.0),
              child: FloatingActionButton(
                child: Icon(Icons.camera_enhance),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );
    var inputFieldSpacer = SizedBox.fromSize(
      size: Size.fromHeight(16),
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar,
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0 * 2),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Client Deatils',
                            style: Theme.of(context).textTheme.title,
                          ),
                          inputFieldSpacer,
                          TextFormField(
                            decoration: InputDecoration(
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              labelText: 'Client Name',
                            ),
                          ),
                          inputFieldSpacer,
                          TextFormField(
                            decoration: InputDecoration(
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              labelText: 'Address',
                            ),
                          ),
                          inputFieldSpacer,
                          Text(
                            'Building Deatils',
                            style: Theme.of(context).textTheme.title,
                          ),
                          inputFieldSpacer,
                          TextFormField(
                            decoration: InputDecoration(
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              labelText: 'No. of Storey',
                            ),
                          ),
                          inputFieldSpacer,
                          TextFormField(
                            decoration: InputDecoration(
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              labelText: 'Original Purpose of Building',
                            ),
                          ),
                          inputFieldSpacer,
                          TextFormField(
                            decoration: InputDecoration(
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              labelText: 'Current Purpose of Building',
                            ),
                          ),
                          inputFieldSpacer,
                          Text(
                            'Area of Building',
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          inputFieldSpacer,
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    labelText: 'Length',
                                  ),
                                ),
                              ),
                              SizedBox.fromSize(
                                size: Size(8.0, 0),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    labelText: 'Breath',
                                  ),
                                ),
                              ),
                              SizedBox.fromSize(
                                size: Size(8.0, 0),
                              ),
                              Text('='),
                              SizedBox.fromSize(
                                size: Size(8.0, 0),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    labelText: 'Area',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          inputFieldSpacer,
                          Text(
                            'Structural System of Building',
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          inputFieldSpacer,
                          DropdownButton(
                            items: [],
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
