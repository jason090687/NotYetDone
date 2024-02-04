import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MyInsertTile extends StatefulWidget {
  MyInsertTile({Key? key}) : super(key: key);

  @override
  State<MyInsertTile> createState() => _MyInsertTileState();
}

class _MyInsertTileState extends State<MyInsertTile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController contactInfoController = TextEditingController();

  PlatformFile? pickedFile; // Fix the typo here

  Future<void> insertData(BuildContext context) async {
    CollectionReference collection = FirebaseFirestore.instance.collection('Records');

    try {
      // Add data to Firestore with the image URL
      await collection.add({
        'Name': nameController.text,
        'Discount': discountController.text,
        'Rating': ratingController.text,
        'Description': descriptionController.text,
        'Location': locationController.text,
        'Price': priceController.text,
        'ContactInfo': contactInfoController.text,
      });

      // Show an indication that data is inserted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data inserted successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear text controllers and reset imageFile after successful insertion
      nameController.clear();
      discountController.clear();
      ratingController.clear();
      descriptionController.clear();
      locationController.clear();
      priceController.clear();
      contactInfoController.clear();
    } catch (e) {
      // Handle errors if any
      print('Error inserting data: $e');

      // Show an indication that there was an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error inserting data. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (pickedFile != null)
            Expanded(child: Container(
              color: Colors.blue[100],
              child: Image.file(
                File(pickedFile!.path!),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
          ElevatedButton(
            onPressed: selectFile,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(70, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: const Text(
              'Upload Image',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: nameController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Name B.H',
              prefixIcon: Icon(Icons.house),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: discountController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Discount',
              prefixIcon: Icon(Icons.discount),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: ratingController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Rating / Reviews',
              prefixIcon: Icon(Icons.star),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: descriptionController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Description',
              prefixIcon: Icon(Icons.description),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: locationController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Location',
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: priceController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Price',
              prefixIcon: Icon(Icons.price_change_sharp),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: contactInfoController,
            obscureText: false,
            decoration: const InputDecoration(
              labelText: 'Contact Info',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(0, 126, 242, 100),
                  width: 2.0,
                ),
              ),
            ),
            style: const TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
          ),
          const SizedBox(height: 20,),

          ElevatedButton(
            onPressed: () {
              insertData(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(70, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: const Text(
              'Insert Data',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
