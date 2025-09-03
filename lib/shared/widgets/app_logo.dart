import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final double borderRadius;

  const AppLogo({
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        'assets/images/logo.png',
        width: width,
        height: height,
        color: color,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          // Debug: Show error info
          print('Logo loading error: $error');
          print('Stack trace: $stackTrace');
          
          // Fallback icon if logo not found
          return Container(
            width: width ?? 120,
            height: height ?? 120,
            decoration: BoxDecoration(
              color: Colors.red, // Changed to red to make it obvious
              borderRadius: BorderRadius.circular(borderRadius > 0 ? borderRadius : 60),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  'Logo Error',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppLogoSmall extends StatelessWidget {
  final Color? color;
  final double borderRadius;

  const AppLogoSmall({
    super.key,
    this.color,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      width: 40,
      height: 40,
      color: color,
      borderRadius: borderRadius,
    );
  }
}

class AppLogoMedium extends StatelessWidget {
  final Color? color;
  final double borderRadius;

  const AppLogoMedium({
    super.key,
    this.color,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      width: 80,
      height: 80,
      color: color,
      borderRadius: borderRadius,
    );
  }
}

class AppLogoLarge extends StatelessWidget {
  final Color? color;
  final double borderRadius;

  const AppLogoLarge({
    super.key,
    this.color,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return AppLogo(
      width: 120,
      height: 120,
      color: color,
      borderRadius: borderRadius,
    );
  }
}
