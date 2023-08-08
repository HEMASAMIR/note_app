import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_notes_cubit/add_notes_cubit.dart';

import '../color_item/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  List<Color> color = [
    const Color(0xff042a2b),
    const Color(0xff5eb1bf),
    const Color(0xff54f2f2),
    const Color(0xfffcfcfc),
    const Color(0xfff4e04d)
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38.0 * 2,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: color.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNotesCubit>(context).color = color[index];
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.6),
              child: ColorItem(
                color: color[index],
                isActive: currentIndex == index,
              ),
            ),
          ),
        ));
  }
}
