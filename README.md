# AwesomeRoute Package Documentation

The AwesomeRoute package is a versatile and easy-to-use Flutter navigation solution that offers a variety of animation options for page transitions. It simplifies the process of implementing animated routes in your Flutter application, allowing for a more dynamic and engaging user experience. This documentation aims to guide developers through integrating the AwesomeRoute package into their applications, detailing its capabilities, and how to utilize its functionalities effectively.

## Features

AwesomeRoute provides several key features to enhance your application's navigation:
    Multiple animation types for page transitions
    Customizable transition durations, background colors, and more
    Ability to navigate while retaining or clearing the navigation history
    Support for passing functions to routes for additional logic execution before navigation

## Installation

To use the AwesomeRoute package in your project, add it to your Flutter project's pubspec.yaml file under dependencies:

```
dependencies:
  flutter:
    sdk: flutter
  awesome_route: ^latest_version
```
Replace ``^latest_version`` with the latest AwesomeRoute package version available.

## Importing

Once installed, import the necessary AwesomeRoute components in your Flutter files where you wish to use them:

```
import 'package:awesome_route/awesome_route.dart';
import 'package:awesome_route/animate_awesome_route.dart';
import 'package:flutter/material.dart';
```

## Usage

### Basic Navigation

AwesomeRoute offers different methods for navigating between pages, with customizable animations and navigation stack handling options.

#### Pushing a Page

To navigate to a new page and keep the previous navigation state intact:

```
AwesomeRoute.push(
  context: context,
  page: NewPageWidget(), // Your destination widget
  child: YourCurrentWidget(), // The widget from which you're navigating
  animationType: AnimateAwesomeRoute.fade, // Choose your animation
  duration: Duration(seconds: 1), // Animation duration
  borderRadius: 10.0, // Optional UI customization
  backgroundColor: Colors.black26, // Optional UI customization
);
```
# Advanced Navigation Options
AwesomeRoute also provides methods for navigating with more control over the navigation stack, such as:

    pushAndClear(): Navigates to a new page and removes the just-left page from the navigation history.
    pushAndClearAll(): Navigates to a new page without keeping any previous navigation history.
    pushRoute(): Allows passing a function to execute additional logic before navigating.
    Each method supports the same customizable parameters as push() for animation and UI customization.

## Animation Types

AwesomeRoute supports a wide range of animation types for transitions, as defined in ``AnimateAwesomeRoute``. Examples include ``fade``, ``slide``, ``rotate``, ``scale``, and various combinations thereof.

## Contribution and Support

The AwesomeRoute package is open for contributions. Developers are encouraged to contribute by reporting any issues, suggesting improvements, or submitting pull requests. For support or to report issues, you can contact the maintainer at kennethusiobaifo@yahoo.com, visit the AwesomeRoute website on https://awesome_route.usiobaifokenneth.com, or check the GitHub repository at https://github.com/kkennymore/awesome_route .

This documentation aims to get you started with the AwesomeRoute package. For more detailed examples and advanced usage, refer to the GitHub repository or the package documentation on the AwesomeRoute website.