# SpeedzCode

A Flutter project that uses the SpeedzCode architecture to create a fast and scalable application. It includes a simple example of how to use the architecture to create a login screen and a home screen.

## Getting Started

This project is a starting point for a Flutter application.

## Folder Structures

```
assets
│
lib
├── core
│ ├── configurations // API Configuration
│ ├── di // Dependency injection (datasource,repository,usecase,cubit )
│ ├── resource // AppAsset and AppString
│ ├── router // Navigation and route management
│ ├── theme // Styling and themes
│ ├── utils // Helper functions (formatting, validators, etc.)
│ └── values // App constants (ConstKeys, colors, SDimension , SSpacing etc.)
│
├── features // Main folder for app features
│ ├── feature1 // Each feature gets its own folder
│ │ ├── data // backend logic implementation
│ │ │ ├── model // Data models response (*Model)
│ │ │ ├── repository // repository implementation (*Rpl)
│ │ │ └── source // Data source management (*Ds , *Rds , *Lds)
│ │ ├── domain // Independent layer
│ │ │ ├── entity // data used in presentation layer (*Entity, *Param , *Arg)
│ │ │ ├── repository // abstract class (Rp)
│ │ │ └── usecase // usecase (*Uc)
│ │ └── presentation // UI and STATE
│ │   ├── cubit // module app logic
│ │   ├── pages // Screen UI (*Page with provider and *View)
│ │   └── widgets // Ui component for the module
│ └── main.dart // App entry point
│
test
```

# API implementation Guide

Coming soon

# BottomNavBar -- keep in mind

    bottomNavigationBar: Container(
          width: double.infinity,
          padding: SSpacing.bottomNavBarPadding(context),
    )

# Widget Guide

- AnyNetwork image use : ImagePreviewCard(uri:"")
- validation : SValidator
- dateTime : SDateTimeUtil
- loading : CentralLoading

# logarte
- Wrap any widget with to enable magic tap for the api response ( 10 tap that widget to see network calls and logs )

- import 'package:logarte/logarte.dart';
- import 'utils/logarte_util.dart';

- Example :
LogarteMagicalTap(
logarte: logarte,
child: Widget(),
)

# Arguments

    enum PageNameFromRoute { possible ,routeName }

    class PageNameArg {
    final PageNameFromRoute fromRoute;
    const PageNameArg({required this.fromRoute});

    Map<String, String> toMap() {
      return {'fromRoute': fromRoute.toString()};
    }

    factory PageNameArg.fromMap(Map<String, String> json) {
      return PageNameArg(
        fromRoute: PageNameFromRoute.values.firstWhere(
          (e) => e.toString() == (json['fromRoute']),
          orElse: () => PageNameFromRoute.routeName,
        ),
      );
    }

}

# Necessary command

- All the necessary commands are available in Makefile

# Change logo

    change logo.png from
    - assets/logo/dev
    - assets/logo/stg
    - assets/logo/prod

    and run
    - make flavor_icons
    - make flavor_splash
