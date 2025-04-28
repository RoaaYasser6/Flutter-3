import 'package:day3/models/customButtom.dart';
import 'package:day3/models/customTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:day3/Screans/login.dart';



class AddTasks extends StatefulWidget {
  final String username;

  const AddTasks({super.key, required this.username});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  bool isActive = false; 
  final List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isActive ? Colors.black : Colors.white;
    final Color textColor = isActive ? Colors.white : Colors.black;
    final Color subTextColor = isActive ? Colors.grey : Colors.grey[800]!;
    final Color cardColor = isActive ? Colors.grey[800]! : Colors.grey[300]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Daily Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: textColor,
          ),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
  backgroundColor: Colors.black,
  width: 320,
  child: SafeArea(
    child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/Mask group.png"),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            widget.username,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TaskStatCard(
              count: tasks.where((task) => !task['isChecked']).length,
              label: 'Task left',
            ),
            const SizedBox(width: 16),
            _TaskStatCard(
              count: tasks.where((task) => task['isChecked']).length,
              label: 'Task done',
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          "Settings",
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        _DrawerListTile(
          icon: Icons.settings,
          text: "App Settings",
        ),
        const SizedBox(height: 10),
        Text(
          "Account",
          style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        _DrawerListTile(
          icon: Icons.person_outline,
          text: "Change account name",
        ),
        _DrawerListTile(
          icon: Icons.key,
          text: "Change account password",
        ),
        _DrawerListTile(
          icon: Icons.camera_alt_outlined,
          text: "Change account Image",
        ),
        _DrawerListTile(
          icon: isActive ? Icons.brightness_2_outlined : Icons.brightness_4_outlined,
          text: "Theme",
          trailing: Switch(
            value: isActive,
            activeColor: Colors.cyanAccent,
            inactiveTrackColor: Colors.cyanAccent,
            onChanged: (val) {
              setState(() {
                isActive = val;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        _DrawerListTile(
          icon: Icons.logout,
          iconColor: Colors.red,
          text: "Log out",
          textColor: Colors.red,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
        ),
        const SizedBox(height: 40), 
      ],
    ),
  ),
),
        
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            CustomTextFiled(
              hintText: 'Enter Task',
              controller: taskController,
              hintColor: textColor,
              prefixIcon: Icon(Icons.edit, color: textColor),
              hittext: '', 
            ),
            const SizedBox(height: 8),
            CustomButton(
              text: 'Add Task',
              backgroundColor: Colors.deepPurple,
              textcolor: Colors.white, 
              textColor: Colors.white,
              color: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  if (taskController.text.trim().isNotEmpty) {
                    tasks.add({
                      'task': taskController.text.trim(),
                      'isChecked': false,
                    });
                    taskController.clear();
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'To do Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: tasks.isEmpty
                  ? Center(
                      child: Text(
                        "No tasks yet.",
                        style: TextStyle(color: subTextColor),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.cyanAccent,
                                value: task['isChecked'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    task['isChecked'] = value!;
                                  });
                                },
                                shape: const CircleBorder(),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task['task'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: textColor,
                                        decoration: task['isChecked']
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    Text(
                                      task['isChecked'] ? "Done" : "Pending",
                                      style: TextStyle(color: subTextColor),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    tasks.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stat Card Widget
class _TaskStatCard extends StatelessWidget {
  final int count;
  final String label;
  const _TaskStatCard({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// Drawer ListTile Widget
class _DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color iconColor;
  final Color textColor;

  const _DrawerListTile({
    required this.icon,
    required this.text,
    this.onTap,
    this.trailing,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: iconColor, size: 22),
      title: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}