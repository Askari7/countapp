import 'package:countapp/components/SideMenu.dart';
import 'package:countapp/pages/HistoricalData.dart';
import 'package:countapp/pages/RecordsScreen.dart';
import 'package:countapp/pages/UserManagement.dart';
import 'package:countapp/responsive.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    
    return Scaffold(
      key: scaffoldKey,
      appBar: screenSize < 600
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
              ),
            )
          : null,
      drawer: screenSize < 600
          ? Drawer(
              child: SideMenu(),
            )
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SideMenu is visible only for large screens
            if (Responsive.isDesktop(context)) 
              Container(
                width: 250, // Fixed width for the side menu
                child: SideMenu(),
              ),
            Expanded(
              // It takes the rest of the screen
              flex: 5,
              child: Navigator(
                key: mainNavigatorKey,
                initialRoute: '/',
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case '/':
                      return MaterialPageRoute(
                          builder: (context) => RecordsScreen());
                    case '/historical':
                      return MaterialPageRoute(
                        builder: (context) => HistoricalData(),
                      );
                    case '/management':
                      return MaterialPageRoute(
                        builder: (context) => UserManagement(),
                      );
                    
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
