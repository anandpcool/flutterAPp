import 'package:flutter/material.dart';

class MenuListItems {
  final String menuTitle;
  final List<MenuListItems> submenuTitle;

  const MenuListItems({
    required this.menuTitle,
    this.submenuTitle = const [],
  });
}

final menuListItems = <MenuListItems>[
  const MenuListItems(menuTitle: "Lead Management", submenuTitle: [
    MenuListItems(menuTitle: "Lead Master Entry"),
    MenuListItems(menuTitle: "Lead Status Report")
  ]),
  const MenuListItems(menuTitle: "Credit/CCM Team", submenuTitle: [
    MenuListItems(menuTitle: "Credit Review"),
    MenuListItems(menuTitle: "Credit Check"),
    MenuListItems(menuTitle: "Credit Approval")
  ]),
  const MenuListItems(menuTitle: "Reports", submenuTitle: [
    MenuListItems(menuTitle: "Collection Report"),
    MenuListItems(menuTitle: "Lead Search Report"),
    MenuListItems(menuTitle: "OverDue MIS")
  ])
];
