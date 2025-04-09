import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF8B5E3C), // Earth brown
        scaffoldBackgroundColor: Color(0xFFF4F2ED), // Light sage green
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF8B5E3C),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xFF8B5E3C,
            {
              50: Color(0xFFFFF8E1),
              100: Color(0xFFFFECB3),
              200: Color(0xFFFFE082),
              300: Color(0xFFFFD54F),
              400: Color(0xFFFFCA28),
              500: Color(0xFFFFC107),
              600: Color(0xFFFFB300),
              700: Color(0xFFFFA000),
              800: Color(0xFFFF8F00),
              900: Color(0xFFFF6F00),
            },
          ),
        ).copyWith(
          secondary: Color(0xFFBCCF6E), // Wheat yellow as the accent color
        ),
      ),
      home: TaskManager(),
    );
  }
}

class TaskManager extends StatefulWidget {
  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _markAsCompleted(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _openTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return TaskModal(onAddTask: _addTask);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        centerTitle: true,
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Text(
                'No tasks added yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (ctx, index) {
                final task = _tasks[index];
                return ListTile(
                  key: ValueKey(task.title),
                  leading: Icon(
                    task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: task.isCompleted ? Colors.green : Colors.grey,
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(task.dateTime ?? 'No date selected'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                  onTap: () => _markAsCompleted(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskModal(context),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class TaskModal extends StatefulWidget {
  final Function(Task) onAddTask;

  TaskModal({required this.onAddTask});

  @override
  _TaskModalState createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  final _titleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  void _submitTask() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final formattedDate = _selectedDate != null
        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
        : null;
    final formattedStartTime = _startTime != null
        ? '${_startTime!.hour}:${_startTime!.minute.toString().padLeft(2, '0')}'
        : null;
    final formattedEndTime = _endTime != null
        ? '${_endTime!.hour}:${_endTime!.minute.toString().padLeft(2, '0')}'
        : null;

    final task = Task(
      title: title,
      dateTime: formattedDate,
      startTime: formattedStartTime,
      endTime: formattedEndTime,
    );

    widget.onAddTask(task);
    Navigator.of(context).pop();
  }

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime(bool isStartTime) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _pickDate,
                    child: Text(_selectedDate == null
                        ? 'Pick Date'
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickTime(true),
                    child: Text(_startTime == null
                        ? 'Start Time'
                        : '${_startTime!.hour}:${_startTime!.minute.toString().padLeft(2, '0')}'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickTime(false),
                    child: Text(_endTime == null
                        ? 'End Time'
                        : '${_endTime!.hour}:${_endTime!.minute.toString().padLeft(2, '0')}'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitTask,
              child: Text('Add Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String? dateTime;
  final String? startTime;
  final String? endTime;
  bool isCompleted;

  Task({
    required this.title,
    this.dateTime,
    this.startTime,
    this.endTime,
    this.isCompleted = false,
  });
}
