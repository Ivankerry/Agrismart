import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/utils/colors.dart';
import 'package:intl/intl.dart';

class RosterEntry {
  final String id;
  final String employeeName;
  final String employeeId;
  final String workDescription;
  final DateTime date;
  bool isDone; // New property to track completion status

  RosterEntry({
    required this.id,
    required this.employeeName,
    required this.employeeId,
    required this.workDescription,
    required this.date,
    this.isDone = false, // Default to false
  });
}

class RostersPage extends StatefulWidget {
  const RostersPage({super.key});

  @override
  State<RostersPage> createState() => _RostersPageState();
}

class _RostersPageState extends State<RostersPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<RosterEntry> _allRosters = [];

  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _workDescriptionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    _employeeNameController.dispose();
    _employeeIdController.dispose();
    _workDescriptionController.dispose();
    super.dispose();
  }

  void _addRoster() {
    if (_formKey.currentState!.validate() && _selectedDay != null) {
      final newEntry = RosterEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        employeeName: _employeeNameController.text.trim(),
        employeeId: _employeeIdController.text.trim(),
        workDescription: _workDescriptionController.text.trim(),
        date: _selectedDay!,
      );

      setState(() {
        _allRosters.add(newEntry);
        _allRosters.sort((a, b) => a.date.compareTo(b.date));
      });

      _employeeNameController.clear();
      _employeeIdController.clear();
      _workDescriptionController.clear();
      Navigator.pop(context);
    }
  }

  void _deleteRoster(String id) {
    setState(() {
      _allRosters.removeWhere((roster) => roster.id == id);
    });
  }

  void _toggleRosterDone(String id) {
    setState(() {
      final roster = _allRosters.firstWhere((roster) => roster.id == id);
      roster.isDone = !roster.isDone;
    });
  }

  List<RosterEntry> _getRostersForDay(DateTime day) {
    return _allRosters.where((roster) => isSameDay(roster.date, day)).toList();
  }

  void _showAddRosterDialog() {
    _employeeNameController.clear();
    _employeeIdController.clear();
    _workDescriptionController.clear();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Add Roster Entry'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'For Date: ${DateFormat.yMMMd().format(_selectedDay!)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _employeeNameController,
                      decoration: InputDecoration(
                        labelText: 'Employee Name',
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: AppColors.textLight,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter employee name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _employeeIdController,
                      decoration: InputDecoration(
                        labelText: 'Employee ID',
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.badge_outlined,
                          color: AppColors.textLight,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter employee ID';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _workDescriptionController,
                      decoration: InputDecoration(
                        labelText: 'Work Description / Task',
                        border: const OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.work_outline,
                          color: AppColors.textLight,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter work description';
                        }
                        return null;
                      },
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.primaryGreen),
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                onPressed: _addRoster,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                ),
                label: const Text('Save Entry'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDayRosters = _getRostersForDay(_selectedDay ?? _focusedDay);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Work Roster Schedule'),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 2.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddRosterDialog,
        backgroundColor: AppColors.primaryGreen,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12.0),
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2035, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.secondaryYellow.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: AppColors.accentBlue),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: AppColors.accentBlue),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child:
                selectedDayRosters.isEmpty
                    ? const Center(
                      child: Text(
                        'No rosters for this day.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      itemCount: selectedDayRosters.length,
                      itemBuilder: (context, index) {
                        final roster = selectedDayRosters[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: roster.isDone,
                              onChanged: (value) {
                                _toggleRosterDone(roster.id);
                              },
                            ),
                            title: Text(
                              roster.employeeName,
                              style: TextStyle(
                                decoration:
                                    roster.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              'ID: ${roster.employeeId}\nTask: ${roster.workDescription}',
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _deleteRoster(roster.id),
                                ),
                                Text(DateFormat.Hm().format(roster.date)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
