import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/components/text_style_comp.dart';
import 'package:newsapp/core/constants/colors_const.dart';
import 'package:newsapp/core/extension/context_extensions.dart';
import 'package:newsapp/views/search/search_view.dart';

class HomeSearchWidget {
  static Padding search(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 35,
              width: context.w * 0.75,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConst.cF0F1FA),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dogecoin to the Moon...",
                    style: MyTextStyleComp.myTextStyle(
                      color: ColorConst.c818181_04,
                      fontSize: 12,
                      weight: FontWeight.w600,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
            onTap: () => showSearch(
              context: context,
              delegate: SearchView(),
            ),
          ),
          CircleAvatar(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorConst.cFF3A44_1, ColorConst.cFF8086_1],
                ),
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/notification.svg",
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* floatingActionButton: FloatingActionButton(
  tooltip: 'Search people',
  onPressed: () => showSearch(
    context: context,
    delegate: SearchPage<Person>(
      // onQueryUpdate: (s) => print(s),
      items: people,
      searchLabel: 'Search people',
      suggestion: const Center(
        child: Text('Filter people by name, surname or age'),
      ),
      failure: const Center(
        child: Text('No person found :('),
      ),
      filter: (person) => [
        person.name,
        person.surname,
        person.age.toString(),
      ],
      builder: (person) => ListTile(
        title: Text(person.name),
        subtitle: Text(person.surname),
        trailing: Text('${person.age} yo'),
      ),
    ),
  ),
  child: Icon(Icons.search),
), */