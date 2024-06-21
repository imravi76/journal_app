import 'package:flutter/material.dart';

class SideTabs extends StatefulWidget {
  final int? selectedTab;
  final Function(int)? tabPressed;

  const SideTabs({super.key, this.selectedTab, this.tabPressed});

  @override
  State<SideTabs> createState() => _SideTabsState();
}

class _SideTabsState extends State<SideTabs> {
  int? _selectedTab;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;

    return Container(
      width: 40.0,
      decoration: const BoxDecoration(
        color: Colors.white12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SideTabBtn(
              title: 'Description',
              onPressed: () {
                widget.tabPressed!(0);
              },
              selected: _selectedTab == 0 ? true : false,
            ),
          ),
          Flexible(
            child: SideTabBtn(
              title: 'Acts & Laws',
              onPressed: () {
                widget.tabPressed!(1);
              },
              selected: _selectedTab == 1 ? true : false,
            ),
          ),
          Flexible(
            child: SideTabBtn(
              title: 'Judgment',
              onPressed: () {
                widget.tabPressed!(2);
              },
              selected: _selectedTab == 2 ? true : false,
            ),
          ),
          Flexible(
            child: SideTabBtn(
              title: 'Templates',
              onPressed: () {
                widget.tabPressed!(3);
              },
              selected: _selectedTab == 3 ? true : false,
            ),
          ),
          Flexible(
            child: SideTabBtn(
              title: 'Questions',
              onPressed: () {
                widget.tabPressed!(4);
              },
              selected: _selectedTab == 4 ? true : false,
            ),
          ),
          Flexible(
            child: SideTabBtn(
              title: 'Evidences',
              onPressed: () {
                widget.tabPressed!(5);
              },
              selected: _selectedTab == 5 ? true : false,
            ),
          ),
        ],
      ),
    );
  }
}

class SideTabBtn extends StatelessWidget {
  final String? title;
  final bool? selected;
  final VoidCallback? onPressed;

  const SideTabBtn({
    super.key,
    this.title,
    this.selected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool selectedTab = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40.0,
        height: 120.0,
        decoration: BoxDecoration(
          color: selectedTab ? null : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
          ),
          border: selectedTab
              ? null
              : const Border(
            left: BorderSide(color: Colors.grey),
          ),
          gradient: LinearGradient(
            colors: selectedTab
                ? [const Color(0xffFF606D), const Color(0xff4A82FF)]
                : [const Color(0xffffffff), const Color(0xffffffff)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: RotatedBox(
          quarterTurns: 3, // Rotate 90 degrees clockwise
          child: Center(
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selectedTab ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
