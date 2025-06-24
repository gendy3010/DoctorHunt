import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTypeSelector extends StatefulWidget {
  final String selectedType;
  final Function(String) onSelected;

  const RecordTypeSelector({
    Key? key,
    required this.onSelected,
    this.selectedType = '',
  }) : super(key: key);

  @override
  State<RecordTypeSelector> createState() => _RecordTypeSelectorState();
}

class _RecordTypeSelectorState extends State<RecordTypeSelector> {
  late String selected;

  final List<Map<String, dynamic>> types = [
    {'label': 'Report', 'icon': Icons.insert_drive_file},
    {'label': 'Invoice', 'icon': Icons.receipt},
    {'label': 'Prescription', 'icon': Icons.medical_services},
  ];

  @override
  void initState() {
    super.initState();
    selected = widget.selectedType;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: types.map((item) {
          final isSelected = selected == item['label'];
          return GestureDetector(
            onTap: () {
              setState(() {
                selected = item['label'];
              });
              widget.onSelected(selected);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'],
                  color: isSelected ?  Colors.green : Colors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: isSelected ? const Color(0xff0EBE7F) : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
