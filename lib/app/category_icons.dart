import 'package:flutter/material.dart';

IconData categoryIcon(String name) {
  switch (name) {
    case 'grid_on':
      return Icons.grid_on;
    case 'format_paint':
      return Icons.format_paint;
    case 'bar_chart':
      return Icons.bar_chart;
    case 'functions':
      return Icons.functions;
    default:
      return Icons.menu_book_outlined;
  }
}
