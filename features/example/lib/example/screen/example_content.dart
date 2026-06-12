import 'package:core_ui/core_ui.dart';

class ExampleContent extends StatefulWidget {
  const ExampleContent({super.key});

  @override
  State<ExampleContent> createState() => _ExampleContentState();
}

class _ExampleContentState extends State<ExampleContent> {
  // final List<bool> _selSelected = <bool>[true, true, true];
  // final List<bool> _selSelectedHalo = <bool>[true, true, true];
  // final List<bool> _selUnselected = <bool>[false, false, false];
  // final List<bool> _selUnselectedHalo = <bool>[false, false, false];
  //
  // final List<bool> _cbSelected = <bool>[true, true, true];
  // final List<bool> _cbSelectedHalo = <bool>[true, true, true];
  // final List<bool> _cbUnselected = <bool>[false, false, false];
  // final List<bool> _cbUnselectedHalo = <bool>[false, false, false];

  final TextEditingController _taEmpty = TextEditingController();
  final TextEditingController _taFilled = TextEditingController(text: 'Filled text');
  final TextEditingController _taError = TextEditingController(text: 'Filled text');
  final TextEditingController _taDisabled = TextEditingController(text: 'Filled text');

  // AppSelectionSize _sizeForIndex(int i) => switch (i) {
  //       0 => AppSelectionSize.xsmall,
  //       1 => AppSelectionSize.small,
  //       _ => AppSelectionSize.large,
  //     };

  // ---------------------------------------------------------------------------
  @override
  // ignore: function_lines_of_code
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ... (rest of the UI code is commented out or static, checking if state usage exists)
            // It seems the current ExampleContent is mostly static and commented out code,
            // except for the AppScaffold/Column structure.
            // Wait, the previous code had BlocConsumer wrapping the scaffold.
            // I will return the Scaffold directly.
            // Note: The original code had a huge list of children, mostly commented out.
            // I will preserve the structure but remove the BlocConsumer wrapper.
            // Since ExampleContent is Stateful, and previously had BlocBuilder,
            // but didn't seem to Use 'state' variable effectively in the active parts (it was used in builder signature).
            // I will just return the scaffold.
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Buttons — states'),
            const SizedBox(height: 8),
            // ... (I will need to be careful not to delete the entire body content)
            // Implementation detail: I will use a larger range in replace_file_content to strip the wrapper
            // but keep the body.
            // Actually, replace_file_content is best used with exact matches.
            // The file content is huge.
            // Let's replace the top and bottom parts.
            // const Text('Selection Controls', style: TextStyle(fontSize: 20)),
            // const SizedBox(height: 12),
            // const Text('Checkbox - xsmall/small/large (interactive unselected)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppCheckbox(
            //       value: _cbUnselected[i],
            //       size: _sizeForIndex(i),
            //       onChanged: (bool v) => setState(() => _cbUnselected[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text('Checkbox - xsmall/small/large (selected)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppCheckbox(
            //       value: _cbSelected[i],
            //       size: _sizeForIndex(i),
            //       onChanged: (bool v) => setState(() => _cbSelected[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text('Checkbox - xsmall/small/large (with halo)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppCheckbox(
            //       value: _cbSelectedHalo[i],
            //       size: _sizeForIndex(i),
            //       isHalo: true,
            //       onChanged: (bool v) => setState(() => _cbSelectedHalo[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text('Checkbox - xsmall/small/large (unselected with halo)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppCheckbox(
            //       value: _cbUnselectedHalo[i],
            //       size: _sizeForIndex(i),
            //       isHalo: true,
            //       onChanged: (bool v) => setState(() => _cbUnselectedHalo[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 24),
            // const Text('Selectable Button - xsmall/small/large (selected)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppSelectableButton(
            //       value: _selSelected[i],
            //       size: _sizeForIndex(i),
            //       onChanged: (bool v) => setState(() => _selSelected[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text('Selectable Button - xsmall/small/large (selected with halo)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppSelectableButton(
            //       value: _selSelectedHalo[i],
            //       size: _sizeForIndex(i),
            //       isHalo: true,
            //       onChanged: (bool v) => setState(() => _selSelectedHalo[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text('Selectable Button - xsmall/small/large (interactive unselected)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppSelectableButton(
            //       value: _selUnselected[i],
            //       size: _sizeForIndex(i),
            //       onChanged: (bool v) => setState(() => _selUnselected[i] = v),
            //     );
            //   }),
            // ),
            // const SizedBox(height: 12),
            // const Text(
            //     'Selectable Button - xsmall/small/large (interactive unselected with halo)'),
            // const SizedBox(height: 8),
            // Row(
            //   spacing: 16,
            //   children: List<Widget>.generate(3, (int i) {
            //     return AppSelectableButton(
            //       value: _selUnselectedHalo[i],
            //       size: _sizeForIndex(i),
            //       isHalo: true,
            //       onChanged: (bool v) => setState(() => _selUnselectedHalo[i] = v),
            //     );
            //   }),
            // ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Buttons — states'),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            const Text('Elevated — states'),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Primary',
              onTap: () {},
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Loading',
              onTap: () {},
              state: ElementState.loading,
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Disabled',
              onTap: () {},
              state: ElementState.disabled,
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 16),
            const Text('Outlined — states'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppOutlinedButton(
                    title: 'Primary',
                    onTap: () {},
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                  const SizedBox(height: 8),
                  AppOutlinedButton(
                    title: 'Loading',
                    onTap: () {},
                    state: ElementState.loading,
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                  const SizedBox(height: 8),
                  AppOutlinedButton(
                    title: 'Disabled',
                    onTap: () {},
                    state: ElementState.disabled,
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Text — states'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AppTextButton(
                    title: 'Primary',
                    onTap: () {},
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                  const SizedBox(height: 8),
                  AppTextButton(
                    title: 'Loading',
                    onTap: () {},
                    state: ElementState.loading,
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                  const SizedBox(height: 8),
                  AppTextButton(
                    title: 'Disabled',
                    onTap: () {},
                    state: ElementState.disabled,
                    prefix: AppIcons.appBarChevronLeft.call(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Elevated — sizes'),
            const SizedBox(height: 8),
            AppElevatedButton(title: 'XS', onTap: () {}),
            const SizedBox(height: 8),
            AppElevatedButton(title: 'S', onTap: () {}),
            const SizedBox(height: 8),
            AppElevatedButton(title: 'L', onTap: () {}),
            const SizedBox(height: 32),
            const Text('Elevated — styles'),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Primary',
              onTap: () {},
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Secondary',
              onTap: () {},
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Tertiary',
              onTap: () {},
              prefix: AppIcons.appBarChevronLeft.call(),
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Accent',
              onTap: () {},
              prefix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 8),
            AppElevatedButton(
              title: 'Error',
              onTap: () {},
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 32),
            const Text('Outlined — styles'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[AppOutlinedButton(title: 'Primary', onTap: () {})],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Text — styles'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[AppTextButton(title: 'Primary', onTap: () {})],
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Inputs'),
            const SizedBox(height: 8),
            AppTextField(canObscure: true, postfixes: <Widget>[AppIcons.appBarChevronLeft.call()]),
            const SizedBox(height: 12),
            AppTextField(
              state: FieldState.disabled,
              canObscure: true,
              postfixes: <Widget>[AppIcons.appBarChevronLeft.call()],
            ),
            const SizedBox(height: 12),
            AppTextField(
              canObscure: true,
              hint: 'Enabled with hint',
              postfixes: <Widget>[AppIcons.appBarChevronLeft.call()],
            ),
            const SizedBox(height: 12),
            AppTextField(
              hint: 'Placeholder',
              postfixes: <Widget>[AppIcons.appBarChevronLeft.call()],
            ),
            const SizedBox(height: 12),
            AppTextField(postfixes: <Widget>[AppIcons.appBarChevronLeft.call()]),
            const SizedBox(height: 12),
            const AppTextField(errorText: 'Error message'),
            const SizedBox(height: 12),
            AppTextField(
              state: FieldState.disabled,
              postfixes: <Widget>[AppIcons.appBarChevronLeft.call()],
            ),
            const SizedBox(height: 40),
            const Text('Text Area'),
            const SizedBox(height: 8),
            AppTextArea(
              controller: _taEmpty,
              title: 'Label',
              hint: 'Placeholder',
              caption: 'Caption',
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 12),
            AppTextArea(
              controller: _taEmpty,
              state: FieldState.disabled,
              title: 'Disabled with hint',
              hint: 'Hint',
              caption: 'Caption',
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 12),
            AppTextArea(
              controller: _taEmpty,
              state: FieldState.disabled,
              title: 'Disabled',
              caption: 'Caption',
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 12),
            AppTextArea(
              controller: _taFilled,
              title: 'Label',
              caption: 'Caption',
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 12),
            AppTextArea(
              controller: _taError,
              title: 'Label',
              error: 'Error message',
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 12),
            AppTextArea(
              controller: _taDisabled,
              state: FieldState.disabled,
              postfix: AppIcons.appBarChevronLeft.call(),
            ),
            const SizedBox(height: 40),
            const Text('Quantity Stepper'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
