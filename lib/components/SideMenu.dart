import 'package:countapp/pages/Main.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {

  SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String activeRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
          ),
        ),
        backgroundColor: const Color(0xFF28242c),
        child: ListView(
          children: [
            DrawerHeader(
              child: SizedBox(
                width: MediaQuery.of(context).size.width > 600 ? 100 : 20,
                height: MediaQuery.of(context).size.width > 600 ? 100 : 20,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/logo.png",
                      width: MediaQuery.of(context).size.width > 600
                          ? 500
                          : 20, // specify the width
                      height: MediaQuery.of(context).size.width > 600
                          ? 30
                          : 20, // specify the height
                    ),
                  ),
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              backgroundColor: Color(0xFFe0444c), // Set background color here
              // svgSrc: "assets/logo.png",
              press: () {
                setActiveRoute('/');
                mainNavigatorKey.currentState!
                    .pushNamed('/'); // Use context here for navigation
              },
            ),
            SizedBox(height: 2,),
            DrawerListTile(
              title: "Historical Data",
              backgroundColor: Color(0xFFe0444c),
              // svgSrc: "assets/logo.png",
              press: () {
                setActiveRoute('/');
                mainNavigatorKey.currentState!
                    .pushNamed('/historical'); // Use context here for navigation
              },
            ),
            SizedBox(height: 2,),
            DrawerListTile(
              title: "User Management",
              backgroundColor: Color(0xFFe0444c),
              // svgSrc: "assets/logo.png",
              press: () {
                setActiveRoute('/management');
                mainNavigatorKey.currentState!.pushNamed('/management');
              },
            ),
          ],
        ),
      ),
    );
  }

  void setActiveRoute(String routeName) {
    setState(() {});
    activeRoute = routeName;
  }
}

// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile(
//       {Key? key,
//       // For selecting those three line once press "Command+D"
//       required this.title,
//       required this.svgSrc,
//       required this.press,
//       this.png = '0'})
//       : super(key: key);
//   final String png;
//   final String title, svgSrc;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: MediaQuery.of(context).size.width > 600
//           ? press
//           : () {
//               press();
//               Navigator.pop(context); // Close the drawer after item is clicked
//             },
//       horizontalTitleGap: 0.0,
//       leading: Image.asset(
//         svgSrc,
//         height: 18,
//       ),
//       title: Container(
//         child: Text(
//           title,
//           style: const TextStyle(color: Colors.white, fontSize: 12),
//         ),
//       ),
//     );
//   }
class DrawerListTile extends StatelessWidget {
  final String title;
  // final String svgSrc;
  final VoidCallback press;
  final Color? backgroundColor; // Optional background color

  const DrawerListTile({
    Key? key,
    required this.title,
    // required this.svgSrc,
    required this.press,
    this.backgroundColor, // Add backgroundColor as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent, // Apply background color
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        // leading: Image.asset(
        //   // svgSrc,
        //   width: 24,
        //   height: 24,
        // ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
