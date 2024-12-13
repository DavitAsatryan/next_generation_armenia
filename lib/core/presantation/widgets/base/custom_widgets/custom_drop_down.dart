import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;
  final bool hasSearchSection;
  final bool hasCheckedBox;
  final bool hasError;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.hint,
    required this.onChanged,
    this.hasSearchSection = false,
    this.hasCheckedBox = false,
    this.hasError = false,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends BaseState<CustomDropdown> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  Map<String, bool> itemChecked = {};
  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      itemChecked[item] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.hasError
                    ? colors.errorColor
                    : colors.duskyBlueColor.withOpacity(0.8),
                width: 0.5),
            borderRadius: BorderRadius.circular(10),
            color: colors.mainBackgroundColor,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: selectedValue,
              hint: Text(
                widget.hint,
                style: fonts.textRegular,
              ),
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item, style: fonts.textRegular),
                          widget.hasCheckedBox
                              ? Checkbox(
                                  checkColor: colors.white,
                                  activeColor: colors.greenColor,
                                  value: itemChecked[item],
                                  onChanged: (isChecked) {
                                    setState(
                                      () {
                                        itemChecked[item] = isChecked ?? false;
                                      },
                                    );
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(value);
              },
              dropdownStyleData: DropdownStyleData(
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(20),
                  thickness: MaterialStateProperty.all(2),
                  thumbColor: MaterialStateProperty.all(colors.greenColor),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
                elevation: 0,
                maxHeight: 200,
                width: 400,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors.white,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: colors.duskyBlueColor,
                      width: 0.2,
                    ),
                  ),
                ),
                offset: const Offset(-20, -6),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              iconStyleData: IconStyleData(
                icon: SvgPicture.asset(
                    'lib/core/presantation/utilities/assets/icons/drop_down_icon.svg'),
                iconSize: 0,
              ),
              dropdownSearchData: widget.hasSearchSection
                  ? DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: colors.duskyBlueColor.withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: colors.duskyBlueColor.withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'lib/core/presantation/utilities/assets/icons/search.svg',
                              height: 16,
                              width: 16,
                              fit: BoxFit.scaleDown,
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: colors.duskyBlueColor.withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    )
                  : null,
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
