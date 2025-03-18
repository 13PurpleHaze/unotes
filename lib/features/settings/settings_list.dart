import 'package:flutter/material.dart';
import 'package:notesapp/app/navigation/navigation.dart';
import 'package:notesapp/app/theme/brightness_view_model.dart';
import 'package:provider/provider.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Enable cringe features',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Switch(value: false, onChanged: (val) => {}),
          ),
          ListTile(
            title: Text(
              'Dark theme',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Consumer<BrightnessViewModel>(
                builder: (context, viewModel, child) => Switch(
                    value: viewModel.brightness == Brightness.dark,
                    onChanged: (val) => {viewModel.changeTheme()})),
          ),
        ],
      ),
    );
  }
}
