import 'package:flutter/material.dart';

class SelectStudentPage extends StatefulWidget {
  const SelectStudentPage({super.key});

  @override
  State<SelectStudentPage> createState() => _SelectStudentPageState();
}

class _SelectStudentPageState extends State<SelectStudentPage> {
  final allChecked = CheckBoxModel(title: 'Select All');
  final checkBoxList = [
    CheckBoxModel(title: "Asad"),
    CheckBoxModel(title: "GM"),
    CheckBoxModel(title: "Arif"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Text("Send",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            const SizedBox(
              width: 30,
            ),
            const Icon(Icons.send),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: () => onAllClicked(allChecked),
                  leading: Checkbox(
                    value: allChecked.value,
                    onChanged: (value) => onAllClicked(allChecked),
                  ),
                  title: Text(allChecked.title.toString()),
                ),
                const Divider(),
                ...checkBoxList
                    .map(
                      (item) => ListTile(
                        onTap: () => onItemClicked(item),
                        leading: Checkbox(
                          value: item.value,
                          onChanged: (value) => onItemClicked(item),
                        ),
                        title: Text(item.title.toString()),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onAllClicked(CheckBoxModel cbkItem) {
    final newValue = !cbkItem.value!;
    setState(() {
      cbkItem.value = !cbkItem.value!;

      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModel cbkItem) {
    final newValue = !cbkItem.value!;
    setState(() {
      cbkItem.value = newValue;
      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value!);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModel {
  String? title;
  bool? value;
  CheckBoxModel({
    required this.title,
    this.value = false,
  });
}
