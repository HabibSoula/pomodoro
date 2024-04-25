import 'package:flutter/material.dart';

const double kDesignHeight = 812.0; // The layout height used in the design
const double kDesignWidth = 375.0; // The layout width used in the design
const double kBaselineDPI =
    1.0; // The baseline device DPI (dots per inch) used for font scaling

class SizeConfig {
  MediaQueryData? _mediaQueryData;
  double? deviceWidth; // Actual device screen width
  double? deviceHeight; // Actual device screen height
  double? deviceDPI; // Actual device pixel density (DPI)

  static final SizeConfig _instance = SizeConfig._();

  factory SizeConfig() => _instance;

  SizeConfig._();

  void init(BuildContext context) {
    // Get the MediaQueryData for the current context
    _mediaQueryData = MediaQuery.of(context);

    // Store the actual device screen width and height
    deviceWidth = _mediaQueryData?.size.width;
    deviceHeight = _mediaQueryData?.size.height;

    // Store the actual device pixel density (DPI)
    deviceDPI = _mediaQueryData?.devicePixelRatio;
  }
}

extension ResponsiveSize on num {
  // Get the proportionate height as per the screen size
  double get h {
    // Get the actual device screen height from SizeConfig, providing a default value of kLayoutHeight if null
    double screenHeight = SizeConfig().deviceHeight ?? kDesignHeight;

    // Calculate the proportionate height based on the layout height and actual screenHeight
    return (this / kDesignHeight) * screenHeight;
  }

  // Get the proportionate width as per the screen size
  double get w {
    // Get the actual device screen width from SizeConfig, providing a default value of kLayoutWidth if null
    double screenWidth = SizeConfig().deviceWidth ?? kDesignWidth;

    // Calculate the proportionate width based on the layout width and actual screenWidth
    return (this / kDesignWidth) * screenWidth;
  }

  // Get the proportionate font size as per the screen width
  double get sp {
    // Get the device width from SizeConfig, providing a default value of kDesignWidth if null
    double deviceWidth = SizeConfig().deviceWidth ?? kDesignWidth;

    // Calculate the proportionate font size based on the design width and actual device width
    return (this / kDesignWidth) * deviceWidth;
  }
}
