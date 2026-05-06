import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MainMenu()),
  );
}

// ============================================
// MAIN MENU SCREEN
// ============================================
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Handbook'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Individual Widget Examples',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          _buildMenuItem(context, '1. Scaffold Class', const ScaffoldExample()),
          _buildMenuItem(context, '2. AppBar Widget', const AppBarExample()),
          _buildMenuItem(
            context,
            '3. FloatingActionButton',
            const FABExample(),
          ),
          _buildMenuItem(
            context,
            '4. BottomNavigationBar',
            const BottomNavExample(),
          ),
          _buildMenuItem(context, '5. Drawer Widget', const DrawerExample()),
          _buildMenuItem(
            context,
            '6. Container Class',
            const ContainerExample(),
          ),
          _buildMenuItem(
            context,
            '7. SizedBox Widget',
            const SizedBoxExample(),
          ),
          _buildMenuItem(
            context,
            '8. ClipRRect Widget',
            const ClipRRectExample(),
          ),
          _buildMenuItem(
            context,
            '9. RichText Widget',
            const RichTextExample(),
          ),
          _buildMenuItem(
            context,
            '10. ListView Class',
            const ListViewExample(),
          ),
          _buildMenuItem(
            context,
            '11. GridView Widget',
            const GridViewExample(),
          ),
          _buildMenuItem(
            context,
            '12. TextField Widget',
            const TextFieldExample(),
          ),
          const Divider(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Capstone Project',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ),
          _buildMenuItem(
            context,
            'Student Course App (Scenario)',
            const StudentCourseApp(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}

// ============================================
// EXAMPLE 1: SCAFFOLD CLASS
// ============================================
class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(title: const Text('Scaffold Example'), centerTitle: true),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Student Name: Ahmad Ahmadi', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Student ID: CS-2024-001', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

// ============================================
// EXAMPLE 2: APPBAR WIDGET
// ============================================
class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back pressed'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => debugPrint('Search pressed'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => debugPrint('Notifications pressed'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => debugPrint('More pressed'),
          ),
        ],
      ),
      body: const Center(
        child: Text('AppBar can show title, menu, and actions.'),
      ),
    );
  }
}

// ============================================
// EXAMPLE 3: FLOATING ACTION BUTTON
// ============================================
class FABExample extends StatefulWidget {
  const FABExample({super.key});

  @override
  State<FABExample> createState() => _FABExampleState();
}

class _FABExampleState extends State<FABExample> {
  int counter = 0;

  void decreaseCounter() {
    setState(() {
      counter = counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FloatingActionButton')),
      body: Center(
        child: Text(
          'Button pressed: $counter times',
          style: const TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: decreaseCounter,
        tooltip: 'Add one',
        child: const Icon(Icons.favorite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// ============================================
// EXAMPLE 4: BOTTOM NAVIGATION BAR
// ============================================
class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Courses Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar')),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// ============================================
// EXAMPLE 5: DRAWER WIDGET
// ============================================
class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  void selectMenu(BuildContext context, String title) {
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$title selected')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Widget')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35, color: Colors.indigo),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Flutter Student App',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => selectMenu(context, 'Dashboard - Welcome'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => selectMenu(context, 'Settings - Configure'),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () => selectMenu(context, 'Help - Assistance'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Open the drawer from the AppBar menu icon.'),
      ),
    );
  }
}

// ============================================
// EXAMPLE 6: CONTAINER CLASS
// ============================================
class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Class')),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.teal, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(2, 4),
                color: Colors.black26,
              ),
            ],
          ),
          child: const Text(
            'Container with gradient, radius, border, and shadow.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// ============================================
// EXAMPLE 7: SIZEDBOX WIDGET
// ============================================
class SizedBoxExample extends StatelessWidget {
  const SizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SizedBox Widget')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('First Text', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button after gap'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home, size: 30),
                SizedBox(width: 20),
                Icon(Icons.person, size: 30),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Fixed Size Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// EXAMPLE 8: CLIPRRECT WIDGET
// ============================================
class ClipRRectExample extends StatelessWidget {
  const ClipRRectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ClipRRect Widget')),
      body: Center(
        child: SizedBox(
          width: 280,
          height: 200,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Container(
              width: 280,
              height: 160,
              color: Colors.deepOrange,
              alignment: Alignment.center,
              child: const Text(
                'Rounded Rectangle',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================
// EXAMPLE 9: RICHTEXT WIDGET
// ============================================
class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    const baseStyle = TextStyle(fontSize: 22, color: Colors.black87);

    return Scaffold(
      appBar: AppBar(title: const Text('RichText Widget')),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: baseStyle,
            children: [
              TextSpan(text: 'Flutter '),
              TextSpan(
                text: 'Mobile Development ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              TextSpan(text: 'allows '),
              TextSpan(
                text: 'multiple styles',
                style: TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(text: ' in one paragraph.'),
              TextSpan(
                text: ' Amazing!',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================
// EXAMPLE 10: LISTVIEW CLASS
// ============================================
class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  final List<String> courses = const [
    'Flutter Basics',
    'Dart Programming',
    'UI Design',
    'State Management',
    'Firebase Integration',
    'Final Project',
    'API Integration',
    'Testing & Debugging',
    'App Deployment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Class')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(courses[index]),
              subtitle: Text('Duration: ${(index + 1) * 2} weeks'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${courses[index]} selected')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ============================================
// EXAMPLE 11: GRIDVIEW WIDGET
// ============================================
class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  final List<Map<String, dynamic>> modules = const [
    {'icon': Icons.code, 'label': 'Dart Basics'},
    {'icon': Icons.widgets, 'label': 'Widgets'},
    {'icon': Icons.layers, 'label': 'Layouts'},
    {'icon': Icons.input, 'label': 'Input Forms'},
    {'icon': Icons.storage, 'label': 'Database'},
    {'icon': Icons.cloud, 'label': 'Firebase'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: modules.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          Color tileColor = index % 2 == 0
              ? Colors.blue.shade100
              : Colors.green.shade100;

          return Container(
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  modules[index]['icon'] as IconData,
                  size: 40,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 8),
                Text(
                  modules[index]['label'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ============================================
// EXAMPLE 12: TEXTFIELD WIDGET
// ============================================
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String greeting = 'Enter your name';
  String emailDisplay = '';

  void updateGreeting() {
    if (nameController.text.isEmpty) {
      setState(() {
        greeting = 'Error: Please enter your name!';
        emailDisplay = '';
      });
      return;
    }

    setState(() {
      greeting = 'Hello, ${nameController.text}!';
      emailDisplay = 'Email: ${emailController.text}';
    });

    nameController.clear();
    emailController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student name',
                hintText: 'Enter your full name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Student email',
                hintText: 'Enter your email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: updateGreeting,
              child: const Text('Show Greeting'),
            ),
            const SizedBox(height: 16),
            Text(greeting, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text(
              emailDisplay,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// CAPSTONE: STUDENT COURSE APP (SCENARIO)
// ============================================
class StudentCourseApp extends StatefulWidget {
  const StudentCourseApp({super.key});

  @override
  State<StudentCourseApp> createState() => _StudentCourseAppState();
}

class _StudentCourseAppState extends State<StudentCourseApp> {
  int selectedIndex = 0;
  final TextEditingController nameController = TextEditingController();
  String studentName = '';

  List<String> courses = [
    'Flutter Basics',
    'Dart Programming',
    'UI Design',
    'State Management',
    'Firebase Integration',
  ];

  // Home Tab
  Widget buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.indigo,
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                      children: [
                        TextSpan(text: 'Welcome to\n'),
                        TextSpan(
                          text: 'Student Course App',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Learn Flutter step by step!',
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Course Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              _buildCategoryTile(Icons.code, 'Coding', Colors.blue),
              _buildCategoryTile(
                Icons.design_services,
                'Design',
                Colors.orange,
              ),
              _buildCategoryTile(Icons.storage, 'Database', Colors.green),
              _buildCategoryTile(Icons.cloud, 'Cloud', Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTile(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  // Courses Tab
  Widget buildCoursesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              courses[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Tap to view details'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${courses[index]} selected')),
              );
            },
          ),
        );
      },
    );
  }

  // Profile Tab
  Widget buildProfileTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Student name',
              hintText: 'Enter your full name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  studentName = nameController.text;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('Show Greeting'),
            ),
          ),
          const SizedBox(height: 20),
          if (studentName.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 30),
                  const SizedBox(width: 12),
                  Text(
                    'Hello, $studentName!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [buildHomeTab(), buildCoursesTab(), buildProfileTab()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Course App'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search tapped')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('More options tapped')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 35, color: Colors.indigo),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Student Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Courses'),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() => selectedIndex = 2);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings selected')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Help selected')));
              },
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          setState(() {
            courses.add('New Course ${courses.length + 1}');
          });
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Add course clicked')));
        },
        tooltip: 'Add Course',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        selectedItemColor: Colors.indigo,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
