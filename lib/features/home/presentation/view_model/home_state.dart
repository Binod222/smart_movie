import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_movie/features/home/presentation/view/bottom_view/home_view.dart';
import 'package:smart_movie/features/home/presentation/view/bottom_view/profile_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        HomePage(),
        const ProfilePage(),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
