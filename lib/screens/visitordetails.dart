import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // For file picking
import 'package:signature/signature.dart'; // For the signature pad
import 'package:image_picker/image_picker.dart'; // For camera usage

class VisitorDetailsPage extends StatefulWidget {
  const VisitorDetailsPage({super.key});

  @override
  _VisitorDetailsPageState createState() => _VisitorDetailsPageState();
}

class _VisitorDetailsPageState extends State<VisitorDetailsPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _tagController = TextEditingController();
  final _personToMeetController = TextEditingController();
  final _companyController = TextEditingController();
  final _timeInController = TextEditingController();
  final _timeOutController = TextEditingController();
  String _floor = '1';
  String? _filePath;
  XFile? _imageFile;
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.transparent,
  );

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  Future<void> _takePhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Details'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Visitor Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
              ),
              const SizedBox(height: 20),
              TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person))),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickFile,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900], foregroundColor: Colors.white),
                child: Text(_filePath == null ? 'Upload ID' : 'File: ${_filePath!.split('/').last}'),
              ),
              const SizedBox(height: 10),
              TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone))),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _floor,
                decoration: const InputDecoration(labelText: 'Floor', prefixIcon: Icon(Icons.layers)),
                items: ['1', '2', '3', '4', '5'].map((floor) => DropdownMenuItem(value: floor, child: Text(floor))).toList(),
                onChanged: (value) => setState(() => _floor = value!),
              ),
              const SizedBox(height: 10),
              TextFormField(controller: _tagController, decoration: const InputDecoration(labelText: 'Tag No.', prefixIcon: Icon(Icons.tag))),
              const SizedBox(height: 10),
              TextFormField(controller: _personToMeetController, decoration: const InputDecoration(labelText: 'Person to Meet', prefixIcon: Icon(Icons.person_add_alt))),
              const SizedBox(height: 10),
              TextFormField(controller: _companyController, decoration: const InputDecoration(labelText: 'Company', prefixIcon: Icon(Icons.business))),
              const SizedBox(height: 10),
              TextFormField(controller: _timeInController, decoration: const InputDecoration(labelText: 'Time In', prefixIcon: Icon(Icons.access_time))),
              const SizedBox(height: 10),
              TextFormField(controller: _timeOutController, decoration: const InputDecoration(labelText: 'Time Out', prefixIcon: Icon(Icons.access_time))),
              const SizedBox(height: 20),
              Text('Signature:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
              const SizedBox(height: 10),
              Signature(controller: _signatureController, height: 200, backgroundColor: Colors.grey[200]!),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _signatureController.clear(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: Text('Clear Signature'),
              ),
              const SizedBox(height: 20),
              // Camera Button - moved below signature
              ElevatedButton(
                onPressed: _takePhoto,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900], foregroundColor: Colors.white),
                child: Text(_imageFile == null ? 'Take a Photo' : 'Photo: ${_imageFile!.name}'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900], foregroundColor: Colors.white),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
