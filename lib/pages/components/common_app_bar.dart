import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onNavigate;
  final ValueNotifier<int> idx;
  const CommonAppBar({super.key, required this.onNavigate, required this.idx});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends State<CommonAppBar> {
  final List<bool> _isHover = [false, false, false, false];
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        flexibleSpace: FlexibleSpaceBar(),
        actions: [
          SizedBox(
            width: 100,
            child: TextButton(
                onPressed: () {
                  widget.onNavigate("/");
                  // setState(() {
                  //   currentIndex = 0;
                  // });
                },
                onHover: (isHover) {
                  setState(() {
                    _isHover[0] = isHover;
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: _isHover[0] || widget.idx.value == 0 ? Colors.deepPurple[300] : Color(0xff666666),
                      fontSize: _isHover[0] ? 15 : 14,
                      fontWeight: _isHover[0] || widget.idx.value == 0 ? FontWeight.w600 : FontWeight.w400),
                )),
          ),
          const Gap(10),
          SizedBox(
            width: 100,
            child: TextButton(
                onPressed: () {
                  widget.onNavigate("/company");
                  // currentIndex =1;
                },
                onHover: (isHover) {
                  setState(() {
                    _isHover[1] = isHover;
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  "Company",
                  style: TextStyle(
                      color: _isHover[1] || widget.idx.value == 1 ? Colors.deepPurple[300] : Color(0xff666666),
                      fontSize: _isHover[1] ? 15 : 14,
                      fontWeight: _isHover[1] || widget.idx.value == 1 ? FontWeight.w600 : FontWeight.w400),
                )),
          ),
          const Gap(10),
          SizedBox(
            width: 100,
            child: TextButton(
                onPressed: () {
                  widget.onNavigate("/product");
                  // currentIndex =2;
                },
                onHover: (isHover) {
                  setState(() {
                    _isHover[2] = isHover;
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  "Product",
                  style: TextStyle(
                      color: _isHover[2] || widget.idx.value == 2 ? Colors.deepPurple[300] : Color(0xff666666),
                      fontSize: _isHover[2] ? 15 : 14,
                      fontWeight: _isHover[2] || widget.idx.value == 2 ? FontWeight.w600 : FontWeight.w400),
                )),
          ),
          const Gap(10),
          SizedBox(
            width: 100,
            child: TextButton(
                onPressed: () {
                  widget.onNavigate("/contact");
                  // currentIndex =3;
                },
                onHover: (isHover) {
                  setState(() {
                    _isHover[3] = isHover;
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  "Contact",
                  style: TextStyle(
                      color: _isHover[3] || widget.idx.value == 3 ? Colors.deepPurple[300] : Color(0xff666666),
                      fontSize: _isHover[3] ? 15 : 14,
                      fontWeight: _isHover[3] || widget.idx.value == 3 ? FontWeight.w600 : FontWeight.w400),
                )),
          ),
        ],
      ),
    );
  }
}
