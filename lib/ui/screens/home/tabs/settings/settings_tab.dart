import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/cores/utils/app_styles.dart';
import 'package:todo_app/cores/utils/colors_manager.dart';
import 'package:todo_app/providors/setting_providor.dart';

typedef OnChanged = void Function(String?);

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedTheme = 'Light';
  String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
            style: LightAppStyle.settingsTabLabel,
          ),
          const SizedBox(
            height: 4,
          ),
          buildSettingsTabComponent(
            'Light',
            'Dark',
            selectedTheme,
            (newTheme) {
              if (newTheme != null) {
                selectedTheme = newTheme;
                myProvider.changeAppTheme(
                  selectedTheme == 'Light' ? ThemeMode.light : ThemeMode.dark,
                );
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Language',
            style: LightAppStyle.settingsTabLabel,
          ),
          const SizedBox(
            height: 4,
          ),
          buildSettingsTabComponent(
            'English',
            'Arabic',
            selectedLang,
            (newLang) {
              selectedLang = newLang ?? selectedLang;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildSettingsTabComponent(
      String item1, String item2, String textView, OnChanged onChanged) {
    return Container(
        height: 48,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            border: Border.all(width: 1, color: ColorsManager.blue)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(textView, style: LightAppStyle.selectedItemLabel),
            DropdownButton<String>(
              underline: const SizedBox(),
              borderRadius: BorderRadius.circular(12),
              items: <String>[item1, item2].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: textView,
              onChanged: onChanged,
            ),
          ],
        ));
  }
}
