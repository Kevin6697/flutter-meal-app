import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutonFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _veganFree = false;

  Widget _switchListTileBuilder(
    String title,
    String description,
    bool currentValue,
    updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutonFree = widget.filters['gluton']!;
    _lactoseFree = widget.filters['lactose']!;
    _vegetarian = widget.filters['vegetarian']!;
    _veganFree = widget.filters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              onPressed: () => {
                widget.setFilters(
                  {
                    'gluton': _glutonFree,
                    'lactose': _lactoseFree,
                    'vegan': _veganFree,
                    'vegetarian': _vegetarian,
                  },
                ),
                Navigator.of(context).pushReplacementNamed('/'),
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _switchListTileBuilder(
                    'Gluton Free',
                    'Only include Gluton free meal',
                    _glutonFree,
                    (newValue) {
                      setState(
                        () {
                          _glutonFree = newValue;
                        },
                      );
                    },
                  ),
                  _switchListTileBuilder(
                    'Lactose Free',
                    'Only include Lactose free meal',
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _switchListTileBuilder(
                    'Vegan Free',
                    'Only include Vegan free meal',
                    _veganFree,
                    (newValue) {
                      setState(
                        () {
                          _veganFree = newValue;
                        },
                      );
                    },
                  ),
                  _switchListTileBuilder(
                    'Vegetarian',
                    'Only include Vegetarian free meal',
                    _vegetarian,
                    (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
