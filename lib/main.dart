import 'package:daily_ease/constants/colors.dart';
import 'package:daily_ease/constants/dimensions.dart';
import 'package:daily_ease/constants/text.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Using our ResponsiveBuilder wrapper
    return ResponsiveBuilder(
      builder: (context, dimensions) {
        return Scaffold(
          backgroundColor: AppColor.backgroundPrimary,
          appBar: AppBar(
            title: Text(
              'Flutter Template',
              style: AppTextTheme.semiBold18.copyWith(color: AppColor.white),
            ),
            backgroundColor: AppColor.primary,
          ),
          body: Padding(
            padding: EdgeInsets.all(dimensions.bodyPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'LayoutBuilder Template',
                  style: AppTextTheme.semiBold25.copyWith(color: AppColor.primary),
                ),
                SizedBox(height: dimensions.marginMedium),
                
                // Colors Section
                Text('Colors:', style: AppTextTheme.semiBold18),
                SizedBox(height: dimensions.marginSmall),
                Row(
                  children: [
                    _ColorBox(color: AppColor.primary, label: 'Primary'),
                    SizedBox(width: dimensions.paddingSmall),
                    _ColorBox(color: AppColor.primaryLight, label: 'Primary Light'),
                    SizedBox(width: dimensions.paddingSmall),
                    _ColorBox(color: AppColor.darkPurple, label: 'Dark Purple'),
                  ],
                ),
                SizedBox(height: dimensions.marginMedium),
                
                // Text Styles Section
                Text('Text Styles:', style: AppTextTheme.semiBold18),
                SizedBox(height: dimensions.marginSmall),
                Text('Label 12', style: AppTextTheme.label12),
                Text('Medium 14', style: AppTextTheme.medium14),
                Text('Semi Bold 16', style: AppTextTheme.semiBold16),
                Text('Semi Bold 20', style: AppTextTheme.semiBold20),
                SizedBox(height: dimensions.marginMedium),
                
                // Responsive Layout Demo
                Text('Responsive Layout:', style: AppTextTheme.semiBold18),
                SizedBox(height: dimensions.marginSmall),
                Container(
                  width: dimensions.maxWidth,
                  padding: EdgeInsets.all(dimensions.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppColor.lightPink2,
                    borderRadius: BorderRadius.circular(dimensions.cardRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Container Width: ${dimensions.maxWidth.toStringAsFixed(1)}',
                        style: AppTextTheme.medium14,
                      ),
                      SizedBox(height: dimensions.marginSmall),
                      Text(
                        'Container Height: ${dimensions.maxHeight.toStringAsFixed(1)}',
                        style: AppTextTheme.medium14,
                      ),
                      SizedBox(height: dimensions.marginSmall),
                      Text(
                        'Screen Type: ${dimensions.isSmallScreen ? 'Small' : dimensions.isMediumScreen ? 'Medium' : 'Large'}',
                        style: AppTextTheme.semiBold16.copyWith(color: AppColor.primary),
                      ),
                      SizedBox(height: dimensions.marginSmall),
                      Text(
                        'Grid Columns: ${dimensions.gridColumnCount}',
                        style: AppTextTheme.medium14,
                      ),
                    ],
                  ),
                ),
                
                // Example buttons
                SizedBox(height: dimensions.marginMedium),
                Text('Example Buttons:', style: AppTextTheme.semiBold18),
                SizedBox(height: dimensions.marginSmall),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    foregroundColor: AppColor.white,
                  ),
                  child: const Text('Primary Button'),
                ),
                SizedBox(height: dimensions.marginSmall),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColor.primary,
                    side: BorderSide(color: AppColor.primary),
                  ),
                  child: const Text('Outlined Button'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ColorBox extends StatelessWidget {
  final Color color;
  final String label;
  
  const _ColorBox({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, dimensions) {
        return Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(dimensions.cardRadius),
              ),
            ),
            SizedBox(height: dimensions.paddingSmall),
            Text(label, style: AppTextTheme.label10),
          ],
        );
      },
    );
  }
}
