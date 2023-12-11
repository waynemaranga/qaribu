import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final messageController = TextEditingController();
  List<String> messages = [];
  List<bool> isUserMessage = [];

  final List<String> fileNames = [
    'company_profile',
    'job_descriptions',
    'meeting_notes',
    'project_documentation',
    'team_structure',
    'sops',
    // Add other file names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            const Text('Hello Njeri!'),
            const SizedBox(
              height: 20,
            ),
            const Text('Welcome to Qaribu, your learning companion!'),
            const SizedBox(
              height: 20,
            ),
            const Text('Welcome to Blue Ocean Technologies here'),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: fileNames
                    .map(
                      (fileName) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // Use the selected file name for further actions
                              // sendRequest(fileName);
                            });
                          },
                          child: Text(fileName),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Align(
                      alignment: isUserMessage[index]
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              isUserMessage[index] ? Colors.blue : Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          messages[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        hintText: 'Chat with Qaribu AI',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      messages.add(messageController.text);
                      isUserMessage.add(true);
                      messageController.clear();
                    });
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

// Inside the sendRequest method in _HomePageState
//  Future<void> sendRequest(String fileName) async {
//     const apiUrl = 'http://192.168.68.160:8000/api/quiz/file-inquiry/';

//     // JSON body to be sent in the POST request
//     final requestBody = <String, dynamic>{
//       'inquiry': 'What is the main focus of the company?',
//       'file_name': fileName,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(requestBody),
//       );

//       if (response.statusCode == 200) {
//         // Parse the JSON response
//         final jsonResponse = jsonDecode(response.body);

//         // Extract the 'content' field from the response
//         final  content = jsonResponse['content'];

//         setState(() {
//           // Display the extracted content in the UI
//           messages.add('File Name: $fileName\n$content');
//           isUserMessage.add(false);
//         });
//       } else {
//         // Handle other status codes
//         print('Request failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('Error during HTTP request: $e');
//     }
//   }
}
