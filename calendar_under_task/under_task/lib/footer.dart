import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text('勉強情報'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('ホーム'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.warning),
          title: Text('しくじり'),
        ),
      ],
    );
  }
}

// class _Footer extends State<Footer> {
//   int _selectedIndex = 0;
//   final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

//   // アイコン情報
//   static const _footerIcons = [
//     Icons.home,
//     Icons.textsms,
//     Icons.access_time,
//     Icons.content_paste,
//     Icons.work,
//   ];

//   // アイコン文字列
//   static const _footerItemNames = [
//     'ホーム',
//     'トーク',
//     'タイムライン',
//     'ニュース',
//     'ウォレット',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _bottomNavigationBarItems.add(_UpdateActiveState(0));
//     for (var i = 1; i < _footerItemNames.length; i++) {
//       _bottomNavigationBarItems.add(_UpdateDeactiveState(i));
//     }
//   }

//   /// インデックスのアイテムをアクティベートする
//   BottomNavigationBarItem _UpdateActiveState(int index) {
//     return BottomNavigationBarItem(
//         icon: Icon(
//           _footerIcons[index],
//           color: Colors.black87,
//         ),
//         title: Text(
//           _footerItemNames[index],
//           style: TextStyle(
//             color: Colors.black87,
//           ),
//         ));
//   }

//   /// インデックスのアイテムをディアクティベートする
//   BottomNavigationBarItem _UpdateDeactiveState(int index) {
//     return BottomNavigationBarItem(
//         icon: Icon(
//           _footerIcons[index],
//           color: Colors.black26,
//         ),
//         title: Text(
//           _footerItemNames[index],
//           style: TextStyle(
//             color: Colors.black26,
//           ),
//         ));
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _bottomNavigationBarItems[_selectedIndex] =
//           _UpdateDeactiveState(_selectedIndex);
//       _bottomNavigationBarItems[index] = _UpdateActiveState(index);
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed, // これを書かないと3つまでしか表示されない
//       items: _bottomNavigationBarItems,
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//     );
//   }
// }
