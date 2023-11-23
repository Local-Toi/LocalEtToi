import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_et_toi/Bloc/navigation_bloc/navigation_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.map),
    label: 'Map',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_border),
    activeIcon: Icon(Icons.favorite),
    label: 'Favorites',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  )
];

const List<Widget> bottomNavScreen = <Widget>[
  Text('Home'),
  Text('Map'),
  Text('Favorites'),
  Text('Search'),
  Text('Profile'),
];

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Color(0xFF095D40),
            unselectedItemColor: Colors.black,
            // do not show the label
            showSelectedLabels: false,
            showUnselectedLabels: false,
            // keep icons in place when tapped
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              BlocProvider.of<NavigationBloc>(context).add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
