import 'package:test_pod_client/test_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  List<Example>? _notes;

  // If the connection to the server fails, this field will hold the exception
  // that was thrown.
  Exception? _connectionException;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    try {
      final notes = await client.example.getAllNotes();
      setState(() {
        _notes = notes;
      });
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _deleteNote(Example note) async {
    try {
      await client.example.deleteNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _createNote(Example note) async {
    try {
      await client.example.createNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  // Future<void> _updateNote(Example note) async {
  //   try {
  //     await client.example.(note);
  //     await _loadNotes();
  //   } catch (e) {
  //     _connectionFailed(e);
  //   }
  // }

  void _connectionFailed(dynamic exception) {
    // If the connection to the server fails, we clear the list of notes and
    // store the exception that was thrown. This will make the loading screen
    // appear and show a button to try again.

    // In a real app you would probably want to do more complete error handling.
    setState(() {
      _notes = null;
      _connectionException = exception;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _notes == null
          ? LoadingScreen(
              exception: _connectionException,
              onTryAgain: _loadNotes,
            )
          : ListView.builder(
              itemCount: _notes!.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(_notes![index].text),
                  onTap: () {
                    // When we tap a list tile we want to show a dialog where
                    // we can edit the note.
                    showNoteDialog(
                      context: context,
                      text: _notes![index].text,
                      onSaved: (text) {
                        // We lazily update the note in the list of notes before
                        // we've received a response from the server which makes
                        // the UI feel more responsive.
                        setState(() {
                          _notes![index].text = text;
                        });

                        // Actually update the note on the server.
                        // _updateNote(
                        //   _notes![index],
                        // );
                      },
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Get the note that we want to delete.
                      var note = _notes![index];

                      // We lazily remove the note from the list of notes before
                      // we've received a response from the server which makes
                      // the UI feel more responsive.
                      setState(() {
                        _notes!.remove(note);
                      });

                      // Actually delete the note from the server.
                      _deleteNote(note);
                    },
                  ),
                );
              }),
            ),
      floatingActionButton: _notes == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                showNoteDialog(
                  context: context,
                  onSaved: (text) {
                    var note = Example(
                      text: text,
                    );

                    // Add the note to the list of notes before we've received
                    // a response from the server which makes the UI feel more
                    // responsive.
                    _notes!.add(note);

                    // Actually create the note on the server.
                    _createNote(note);
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}

void showNoteDialog({
  required BuildContext context,
  String text = '',
  required ValueChanged<String> onSaved,
}) {
  showDialog(
    context: context,
    builder: (context) => NoteDialog(
      text: text,
      onSaved: onSaved,
    ),
  );
}

class NoteDialog extends StatefulWidget {
  const NoteDialog({
    required this.text,
    required this.onSaved,
    super.key,
  });

  final String text;
  final ValueChanged<String> onSaved;

  @override
  NoteDialogState createState() => NoteDialogState();
}

class NoteDialogState extends State<NoteDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your note here...',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onSaved(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Displays a progress indicator when we are loading notes from the server. Or
/// a button to try again if the connection to the server failed.
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    this.exception,
    required this.onTryAgain,
    super.key,
  });

  final Exception? exception;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    if (exception != null) {
      return Center(
        child: ElevatedButton(
          onPressed: onTryAgain,
          child: const Text('Try again'),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
