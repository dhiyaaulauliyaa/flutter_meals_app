import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> _selectedFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  @override
  initState() {
    _selectedFilters['gluten'] = widget.currentFilters['gluten'];
    _selectedFilters['lactose'] = widget.currentFilters['lactose'];
    _selectedFilters['vegetarian'] = widget.currentFilters['vegetarian'];
    _selectedFilters['vegan'] = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  void _updateValue(bool newValue, String filter) {
    setState(() {
      _selectedFilters[filter] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print(_selectedFilters);
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _selectedFilters['gluten'],
                  (newValue) => _updateValue(newValue, 'gluten'),
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _selectedFilters['lactose'],
                  (newValue) => _updateValue(newValue, 'lactose'),
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _selectedFilters['vegetarian'],
                  (newValue) => _updateValue(newValue, 'vegetarian'),
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _selectedFilters['vegan'],
                  (newValue) => _updateValue(newValue, 'vegan'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
