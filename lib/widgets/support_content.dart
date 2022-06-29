import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SupportContent extends StatelessWidget {
  const SupportContent();

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Interface'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Linguagem'),
              value: Text('Português - Brasil'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: false,
              leading: Icon(Icons.format_paint),
              title: Text('Modo escuro'),
            ),
          ],
        ),
      ],
    );
  }
}