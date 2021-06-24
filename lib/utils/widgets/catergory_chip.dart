import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_list/api/models/category.dart';

class CategoryList extends StatelessWidget{
  final List<Category> categories;

  const CategoryList({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: categories.map((e) => _buildChip(e.name, _getRandomColor())).toList().cast<Widget>(),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 4.0,
      padding: EdgeInsets.all(8.0),
    );
  }

  Color _getRandomColor(){
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}