import 'package:doc_hunt/screens/add%20record/widgets/record_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_routes.dart';
import '../../widgets/buttons/Custom Button.dart';
import '../../widgets/header/top_section.dart';
import 'all_records_screen.dart';

class AddRecordsScreen extends StatefulWidget {
  const AddRecordsScreen({super.key});

  @override
  State<AddRecordsScreen> createState() => _AddRecordsScreenState();
}

class _AddRecordsScreenState extends State<AddRecordsScreen> {
  String recordName = '';
  String recordType = '';
  String recordDate = '';

  final List<MedicalRecord> records = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/find_doctor_screen/find_doctor_screen_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSection(
                text: 'Add Records',
                backButton: const Icon(Icons.chevron_left),
                onPressed: () {
                  Get.toNamed(AppRoutes.home);
                },
              ),
              SizedBox(height: screenWidth * 0.04),
              Row(
                children: [
                  Image.asset('assets/images/addRecordsImage.jpg'),
                  SizedBox(width: 15,),
                  Container(
                    child: Column(
                      children: [
                        Icon(Icons.add,color: Colors.green,size: 55,),
                        Text(
                          textAlign: TextAlign.center,
                          'Add a medical record.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontFamily: 'Rubik',),)
                      ],
                    ),
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                  ),

                ],
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  title: 'Upload record',
                  onTap: () async {
                    final result = await addRecordSheet(context);
                    if (result == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecordsListScreen(records: records),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> addRecordSheet(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    TextEditingController nameController = TextEditingController(text: recordName);
    TextEditingController dateController = TextEditingController(text: recordDate);

    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.07,
                left: screenWidth * 0.06,
                right: screenWidth * 0.06,
                bottom: screenHeight * 0.07 + MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.025),
                    Text("Record for", style: GoogleFonts.rubik()),
                    TextFormField(
                      controller: nameController,
                      cursorColor: const Color(0xff0EBE7F),
                      decoration: InputDecoration(
                        hintText: 'Your Name',
                        hintStyle: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff677294),
                        ),
                        border: const UnderlineInputBorder(),
                        suffix: const Icon(Icons.edit),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (val) {
                        setModalState(() {
                          recordName = val;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text("Type of record", style: GoogleFonts.rubik()),
                    SizedBox(height: screenHeight * 0.02),
                    RecordTypeSelector(
                      selectedType: recordType,
                      onSelected: (value) {
                        setModalState(() {
                          recordType = value;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text("Record created on", style: GoogleFonts.rubik()),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      cursorColor: const Color(0xff0EBE7F),
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        hintStyle: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff677294),
                        ),
                        border: const UnderlineInputBorder(),
                        suffixIcon: const Icon(Icons.calendar_today),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          String formattedDate = "${pickedDate.day} ${_monthName(pickedDate.month)}, ${pickedDate.year}";
                          setModalState(() {
                            dateController.text = formattedDate;
                            recordDate = formattedDate;
                          });
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    SizedBox(
                      height: screenHeight * 0.07,
                      width: screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          if (recordName.isEmpty ||
                              recordType.isEmpty ||
                              recordDate.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all fields'),
                              ),
                            );
                            return;
                          }

                          final newRecord = MedicalRecord(
                            name: recordName,
                            type: recordType,
                            date: recordDate,
                          );

                          setState(() {
                            records.add(newRecord);
                            recordName = '';
                            recordType = '';
                            recordDate = '';
                          });

                          Navigator.pop(context, true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0EBE7F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Save Record',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }
}


