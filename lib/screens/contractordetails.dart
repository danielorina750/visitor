import 'dart:io';  // Import to use File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:signature/signature.dart';

class ContractorDetailsPage extends StatefulWidget {
  const ContractorDetailsPage({super.key});

  @override
  _ContractorDetailsPageState createState() => _ContractorDetailsPageState();
}

class _ContractorDetailsPageState extends State<ContractorDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  XFile? _image;  // To store the captured image
  XFile? _idFile; // To store the ID file

  // Controller for the text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController personToMeetController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController timeInController = TextEditingController();
  TextEditingController timeOutController = TextEditingController();

  // For Signature
  late SignatureController signatureController;

  @override
  void initState() {
    super.initState();
    signatureController = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 5,
    );
  }

  @override
  void dispose() {
    signatureController.dispose();
    super.dispose();
  }

  // Method to pick image (for photo)
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = pickedFile;
    });
  }

  // Method to pick a file (for ID)
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _idFile = XFile(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contractor Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // ID File Upload
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text('Upload ID File'),
              ),
              _idFile != null
                  ? Text('File uploaded: ${_idFile!.path}')
                  : const SizedBox.shrink(),
              const SizedBox(height: 10),
              // Phone Number Field
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Floor Field
              TextFormField(
                controller: floorController,
                decoration: const InputDecoration(labelText: 'Floor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the floor number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Tag Number Field
              TextFormField(
                controller: tagController,
                decoration: const InputDecoration(labelText: 'Tag No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the tag number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Person To Meet Field
              TextFormField(
                controller: personToMeetController,
                decoration: const InputDecoration(labelText: 'Person to Meet'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the person to meet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Company Field
              TextFormField(
                controller: companyController,
                decoration: const InputDecoration(labelText: 'Company'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Time In Field
              TextFormField(
                controller: timeInController,
                decoration: const InputDecoration(labelText: 'Time In'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time in';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Time Out Field
              TextFormField(
                controller: timeOutController,
                decoration: const InputDecoration(labelText: 'Time Out'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time out';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // Signature Pad
              Signature(
                controller: signatureController,
                width: 300,
                height: 200,
                backgroundColor: Colors.grey[300]!,
              ),
              const SizedBox(height: 10),
              // Camera Button to capture image
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Capture Contractor Photo'),
              ),
              _image != null
                  ? Image.file(
                      File(_image!.path),  // Now correctly using File class
                      height: 150,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit the data (show a message or navigate to another page)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contractor Details Submitted')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
