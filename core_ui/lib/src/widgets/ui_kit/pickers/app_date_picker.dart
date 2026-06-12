import 'package:core_ui/core_ui.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AppDatePicker extends StatefulWidget {
  final void Function(DateTime) onSelected;
  final DateTime? initialDate;

  const AppDatePicker({super.key, required this.onSelected, this.initialDate});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate ?? DateTime.now();
    _selectedDay = widget.initialDate;
    initializeDateFormatting('ru');
  }

  @override
  void didUpdateWidget(AppDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate == oldWidget.initialDate || widget.initialDate == null) return;
    setState(() {
      _focusedDay = widget.initialDate!;
      _selectedDay = widget.initialDate;
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (isSameDay(_selectedDay, selectedDay)) return;
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    widget.onSelected(selectedDay);
  }

  void _updateMonth(int offset) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + offset, _focusedDay.day);
    });
  }

  void _updateYear(int offset) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year + offset, _focusedDay.month, _focusedDay.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String monthName = DateFormat.MMMM('ru').format(_focusedDay).capitalize();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: colors.background.main,
        borderRadius: BorderRadius.circular(10),
        boxShadow: context.colors.dialogShadows,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.maxFinite,
              height: 42,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: colors.borders.accentOrange, width: 2)),
              ),
              child: Center(child: AppIcons.calendar.call(color: colors.icons.accent, size: 24)),
            ),
          ),
          Row(
            spacing: 10,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => _updateMonth(-1),
                      icon: Icon(Icons.chevron_left, color: colors.icons.main),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          monthName,
                          style: AppFonts.b4.copyWith(color: colors.text.main),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _updateMonth(1),
                      icon: Icon(Icons.chevron_right, color: colors.icons.main),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => _updateYear(-1),
                      icon: Icon(Icons.chevron_left, color: colors.icons.main),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${_focusedDay.year}',
                          style: AppFonts.b4.copyWith(color: colors.text.main),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _updateYear(1),
                      icon: Icon(Icons.chevron_right, color: colors.icons.main),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TableCalendar<Widget>(
              locale: 'ru',
              firstDay: DateTime(1900),
              lastDay: DateTime(2050),
              focusedDay: _focusedDay,
              headerVisible: false,
              availableGestures: AvailableGestures.none,
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekHeight: 36,
              rowHeight: 36,
              selectedDayPredicate: (DateTime day) => isSameDay(_selectedDay, day),
              onDaySelected: _onDaySelected,
              onPageChanged: (DateTime focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: AppFonts.b2.copyWith(color: colors.text.main),
                weekendTextStyle: AppFonts.b2.copyWith(color: colors.text.disabled),
                disabledTextStyle: AppFonts.b2.copyWith(color: colors.text.disabled),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppFonts.b2.copyWith(color: colors.text.main),
                weekendStyle: AppFonts.b2.copyWith(color: colors.text.main),
              ),
              calendarBuilders: CalendarBuilders<Widget>(
                selectedBuilder: (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colors.icons.accent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text('${day.day}', style: AppFonts.b4.copyWith(color: Colors.white)),
                      ),
                    ),
                  );
                },
                todayBuilder: (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Center(
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: colors.text.disabled),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: AppFonts.b2.copyWith(color: colors.text.main),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
