import 'package:flutter/material.dart';
import './FriendView.dart';
import './Network.dart';

class TestRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestBottomNavigator();
    
  }
}

class TestBottomNavigator extends StatefulWidget {
  @override
  _TestBottomNavigatorState createState() => _TestBottomNavigatorState();
}

class _TestBottomNavigatorState extends State<TestBottomNavigator> {
  var _currentIndex = 0;
  final List<Widget> _childWidget = [
    _HomeWidget(),
    NetworkView(),
    FriendView()
  ];

  var _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (newPage){
          setState((){
            this._currentIndex=newPage;
          });
        },
        children: _childWidget,
    
        ),
        
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: _TestBottomNavigationBarItem.toList(),
            onTap: (index) => setState(() {
                  print(index);
                  _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  _currentIndex = index;
                })));
  }
}

const List<BottomNavigationBarItem> _TestBottomNavigationBarItem = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
  BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('apps')),
  BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('person'))
];

class _HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<_HomeWidget> with AutomaticKeepAliveClientMixin{
  var _count = 0;
  
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print(_count);
    return Scaffold(
        appBar: AppBar(title: Text("Home"),),
        body: Text('Home count: $_count'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () => setState(() {
            _count += 1;
          }),
        ));
  }


}

class _AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<_AppWidget> with AutomaticKeepAliveClientMixin{
  var _count = 0;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Text('app count: $_count'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () => setState(() {
            _count += 1;
          }),
        )
      );
  }
}

