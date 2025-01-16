import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

String? selectedValue;

class DropdownBtn extends StatelessWidget {

  final List<String> items;
  final Function(String?) onSelected;
  final String selectedItem;

  const DropdownBtn({super.key, required this.items, required this.selectedItem, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 50,
        child: Card(
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  selectedItem,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,

                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  onSelected(value);
                },
                buttonStyleData: ButtonStyleData(
                    height: 30,
                    width: 100,
                    decoration:
                    BoxDecoration(shape: BoxShape.circle)
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    color: Colors.black,
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
