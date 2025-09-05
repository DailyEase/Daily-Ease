import 'package:flutter/material.dart';

class AppDimensions {
  final BoxConstraints constraints;
  
  // Constructor now takes BoxConstraints directly from LayoutBuilder
  const AppDimensions(this.constraints);
  
  // Max available width and height from constraints
  double get maxWidth => constraints.maxWidth;
  double get maxHeight => constraints.maxHeight;
  
  // Padding values based on container width
  double get bodyPadding => maxWidth * 0.04;
  double get paddingSmall => maxWidth * 0.02;
  double get paddingMedium => maxWidth * 0.05;
  double get paddingLarge => maxWidth * 0.08;
  
  // Margin values based on container width
  double get marginSmall => maxWidth * 0.02;
  double get marginMedium => maxWidth * 0.04;
  double get marginLarge => maxWidth * 0.08;
  
  double get paddingBetweenIconsInRow => maxWidth * 0.04;
  double get cardRadius => maxWidth * 0.04;
  
  // Helper method to determine responsive breakpoints
  bool get isSmallScreen => maxWidth < 600;
  bool get isMediumScreen => maxWidth >= 600 && maxWidth < 900;
  bool get isLargeScreen => maxWidth >= 900;
  
  // Get grid column count based on available width
  int get gridColumnCount {
    if (isSmallScreen) return 2;
    if (isMediumScreen) return 3;
    return 4; // Large screen
  }
}

// Extension for easier use with LayoutBuilder
extension AppDimensionsExtension on BoxConstraints {
  AppDimensions get dimensions => AppDimensions(this);
}

// Helper widget to wrap your screen content
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AppDimensions dimensions) builder;
  
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, AppDimensions(constraints));
      },
    );
  }
}
