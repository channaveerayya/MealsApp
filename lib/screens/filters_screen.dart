import 'package:MealsApp/screens/category_meals_screen.dart';
import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const filterScreenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegerarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegerarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    Function updatedValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updatedValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
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
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegerarian,
                };
                widget.saveFilters(selectedFilters);
                Navigator.of(context).pushNamed('/');
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten Free',
                  'Only include Gluten-free meals',
                  _glutenFree,
                  (newValue) => setState(() => _glutenFree = newValue),
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Only include Lactose-free meals',
                  _lactoseFree,
                  (newValue) => setState(() => _lactoseFree = newValue),
                ),
                buildSwitchListTile(
                  'Vegetarien',
                  'Only include Vegetarien meals',
                  _vegerarian,
                  (newValue) => setState(() => _vegerarian = newValue),
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  (newValue) => setState(() => _vegan = newValue),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegerarian,
            };
            widget.saveFilters(selectedFilters);
            Navigator.of(context).pushNamed('/');
          }),
    );
  }
}
