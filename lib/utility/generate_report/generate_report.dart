import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:house_review/models/kitchen_inspection/kitchen_inspection.dart';
import 'package:house_review/models/luxmeter_reading.dart';
import 'package:house_review/models/minor_checks/minor_checks.dart';
import 'package:house_review/models/room.dart';
import 'package:house_review/models/seepage_analysis.dart';
import 'package:house_review/models/staircase_inspection/staircase_inspection.dart';
import 'package:house_review/models/toilet_inspection/toilet_inspection.dart';
import 'package:house_review/models/water_quality.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';

part './generate_image_grid.dart';
part 'generate_room_report/generate_room_report.dart';

String materialUsedString(List<String> materials) {
  String materialUsed = '';

  materials.asMap().keys.forEach((materialIndex) {
    if (materialIndex == materials.length) {
      materialUsed = materials[materialIndex];
    }
    materialUsed += '${materials[materialIndex]}, ';
  });
  return materialUsed;
}

Future<Uint8List> generateReport(InspectionData inspectionData) async {
  final Document doc = Document(
    title: 'Home Inspection Report',
    author: 'Skill Sewa',
  );

  final PdfImage houseImage = inspectionData.buildingData.photo != null
      ? PdfImage.file(
          doc.document,
          bytes: File(inspectionData.buildingData.photo)
              .readAsBytesSync()
              .buffer
              .asUint8List(),
        )
      : null;

  final PdfImage logo = PdfImage.file(doc.document,
      bytes: (await rootBundle.load('assets/logo.png')).buffer.asUint8List());

  doc.addPage(Page(
    build: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              logo != null
                  ? Image(
                      logo,
                      fit: BoxFit.contain,
                      width: 150,
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    'Home Inspection Report',
                    style: Theme.of(context).header0,
                  ),
                ),
              ),
            ],
          ),
          Image(
            houseImage,
            fit: BoxFit.contain,
            height: 350,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Client\'s Name: ${inspectionData.name}',
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Address: ${inspectionData.address}',
                  ),
                ],
              ),
            ],
          )
        ],
      );
    },
  ));
  doc.addPage(
    Page(
      build: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Paragraph(
              text:
                  'Thank you for showing interest on Skill Sewa Home Inspection for Seepage Inspection of your residence . Our company is delight and glad to submit Inspection report to overcome the faulty designs and practices in your residence. We are successful to establish the most trusted image for Building Inspection & Renovation in Nepal and had a good track record of satisfied customer in this field.',
            ),
            Header(text: 'Skill Sewa'),
            Paragraph(
              text:
                  'Considering all the engineering as well as household maintenance service, Skill Sewa Pvt. Ltd. has been established with the motto "Service at Your Doorstep" and providing service from Baneshwor, Kathmandu. Qualified engineers and skilled manpower\'s are associated with this company. The objectives of the company are to minimize the time frame of the customer and make them problem free by providing quality service  for your residence.',
            ),
            Header(text: 'Why Skill Sewa?'),
            Bullet(
              text:
                  'Skill Sewa is One - Stop solution to all your daily problems.',
            ),
            Bullet(
              text:
                  'We are Nepal Government\'s Registered Company with reliable working capability.',
            ),
            Bullet(
              text:
                  'We have skilled and pre-verified professionals at your services.',
            ),
            Bullet(
              text:
                  'We provide different service packages suitable at your comfort zone.',
            ),
            Bullet(
              text:
                  'All the services are available on fix and at reasonable cost.',
            ),
            Bullet(
              text:
                  'Starting from plumbing & electrical services, home inspection, deep cleaning, home tuition and many more as per requirement of costumers.',
            ),
            Bullet(
              text:
                  'We create sound environment for your house/offices/organization/school/college, etc.',
            ),
            Bullet(
              text:
                  'We ensure to meet your standard of expectation at all level.',
            ),
            Header(text: 'How Does it Work?'),
            Paragraph(
              text:
                  'What makes us different is our business model; we run a \'Full Stack\' business. For the consumers, we are a single-click service provider. The customer clicks on a service, Skill Sewa ensures the best match of a service provider, ensures the provider reaches the customer on time, the pricing is transparent to the customer, and on completion, it ensures the job for any issues. In case of any delays, the Skill Sewa automatically manages for backup service provider.',
            ),
          ],
        );
      },
    ),
  );
  doc.addPage(MultiPage(
    build: (context) {
      return [
        Header(text: 'Terms and condition'),
        Bullet(
          text:
              'SKILLSEWA (Here in after "INSPECTOR") INSPECTOR has performed a visual as well as technical inspection of the property and provides the CLIENT with an inspection report giving an opinion of the present condition of the property, based on a visual examination of the readily accessible features of the property. Common elements, such as exterior elements, parking, common mechanical and electrical systems and structure, are not inspected.',
        ),
        Bullet(
          text:
              'INSPECTOR has performed engineering, architectural, plumbing, or any other job function requiring an occupational license in the jurisdiction where the inspection is taking place.',
        ),
        Bullet(
          text:
              'The Inspection of this property is subject to Limitations and Conditions set out in this Report.',
        ),
        Bullet(
          text:
              'LIMITATIONS AND CONDITIONS OF THE PROPERTY INSPECTION: There are limitations to the scope of this Inspection. It provides a general overview of the more obvious repairs that may be needed. It is not intended to be an exhaustive list. The ultimate decision of what to repair or replace is client\'s. One client / homeowner may decide that certain conditions require repair or replacement, while another will not.',
        ),
        Bullet(
          text:
              'THE INSPECTION IS NOT TECHNICALLY EXHAUSTIVE: The property Inspection provides the client with a basic overview of the condition of the unit. The Inspection is not technically exhaustive. Further, there are many complex systems in the property that are common element and not within the scope of the inspection. Specialists would typically be engaged by the Condominium Association to review these systems as necessary. Some conditions noted, such as wall cracks or other signs of settlement, may either be cosmetic or may indicate a potential problem that is beyond the scope of the Inspection. If client is concerned about any conditions noted in the Inspection Report, Inspector strongly recommends that client consults a qualified Licensed Contractor / Professional or Consulting Engineer. These professionals can provide a more detailed analysis of any conditions noted in the Report at an additional cost.',
        ),
        Bullet(
          text:
              'THE INSPECTION IS AN OPINION OF THE PRESENT CONDITION OF THE VISIBLE COMPONENTS: The Inspector\'s Report is an opinion of the present condition of the property. It is based on a visual examination of the readily accessible features of the property. A property Inspection does not include identifying defects that are hidden behind walls, floors or ceilings. This includes wiring, heating, cooling, structure, plumbing and insulation that are hidden or inaccessible. Some intermittent problems may not be obvious on an Inspection because they only happen under certain circumstances. As an example, Inspector may not discover leaks that occur only during certain weather conditions or when a specific tap or appliance is being used in everyday life. Inspectors will not find conditions that may only be visible when storage or furniture is moved. They  do not remove wall coverings (including wallpaper) or lift flooring (including carpet) or move storage or furniture to look underneath or behind.',
        ),
        Bullet(
          text:
              'THIS IS NOT A CODE-COMPLIANCE INSPECTION: The Inspector does NOT try to determine whether or not any aspect of the property complies with any past, present or future codes (such as building codes, electrical codes, fuel codes, fire codes, etc.), regulations, laws, by-laws, ordinances or other regulatory requirements.',
        ),
        Bullet(
          text:
              'INSPECTION DOES NOT COMMENT ON THE QUALITY OF AIR IN A BUILDING: The Inspector does not try to determine if there are irritants, pollutants, contaminants, or toxic materials in or around the property.',
        ),
        Bullet(
          text:
              'Client should note that whenever there is water damage noted in the report, there is a possibility that mold or mildew may be present, unseen behind a wall, floor or ceiling. If anyone in the property suffers from allergies or heightened sensitivity to quality of air, Inspector strongly recommend to consult a qualified Environmental Consultant who can test for toxic materials, mold and allergens at additional cost.',
        ),
        Bullet(
          text:
              'THE INSPECTION DOES NOT INCLUDE HAZARDOUS MATERIALS: This includes building materials that are now suspected of posing a risk  to health such as phenol-formaldehyde &urea-formaldehyde based insulation, fiberglass insulation &vermiculite insulation. The Inspector does not identify asbestos roofing, siding, wall, ceiling or floor finishes, insulation or fire proofing. Inspectors do not look for lead or other toxic metals  in such things as pipes, paint or window coverings. The Inspection does not deal with environmental hazards such as past use of insecticides, fungicides, herbicides or pesticides. The Inspector does not look for, or comment on, the past use of chemical termite treatments in or around  the property.',
        ),
        Bullet(
          text:
              'REPORT IS FOR CLIENT ONLY: The inspection report is for the exclusive use of the client named herein. No use of the information by any  other party is intended.',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: BoxBorder(
                    bottom: true,
                    left: true,
                    right: true,
                    top: true,
                    width: 1,
                    color: PdfColors.black,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client\'s Name: ${inspectionData.name}',
                    ),
                    Text(
                      'Address: ${inspectionData.address}',
                    ),
                    Text(
                      'Date of Inspection: ${inspectionData.dateOfInspection.year}-${inspectionData.dateOfInspection.month}-${inspectionData.dateOfInspection.day}',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: BoxBorder(
                    bottom: true,
                    left: true,
                    right: true,
                    top: true,
                    width: 1,
                    color: PdfColors.black,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home Inspector Name: ${inspectionData.name}',
                    ),
                    Text(
                      'Designation: ${inspectionData.address}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ];
    },
  ));
  doc.addPage(
    MultiPage(
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          decoration: const BoxDecoration(
              border:
                  BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
          child: Text(
            'Home Inspection Report',
            style: Theme.of(context).defaultTextStyle,
          ),
        );
      },
      footer: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: Text(
            'Page ${context.pageNumber}',
            style: Theme.of(context).defaultTextStyle,
          ),
        );
      },
      build: (context) {
        return [
          Header(
            text: 'General Building Information',
          ),
          houseImage != null
              ? Image(
                  houseImage,
                  fit: BoxFit.contain,
                  height: 200,
                )
              : Container(),
          Paragraph(
            text:
                'Structural System of Building: ${inspectionData.buildingData.structuralSystem?.systemName ?? ''}',
          ),
          Paragraph(
            text: 'Building Dimensions',
          ),
          Table(
            children: [
              TableRow(
                children: [
                  Container(
                    child: Text('Length (ft)'),
                  ),
                  Container(
                    child: Text(
                        inspectionData.buildingData.length.toString() ?? ''),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    child: Text('Length (ft)'),
                  ),
                  Container(
                    child: Text(
                        inspectionData.buildingData.length.toString() ?? ''),
                  ),
                ],
              ),
              // TableRow(),
            ],
          ),
          Paragraph(
            text: 'No. of Storey: ${inspectionData.buildingData.storeyNo}',
          ),
          Paragraph(
            text:
                'Materials User: ${materialUsedString(inspectionData.buildingData.materialUsed)}',
          ),
          Paragraph(
            text:
                'Supervision Status: ${inspectionData.buildingData.supervisionStatus}',
          ),
          Paragraph(
            text:
                'Original  Purpose of Building: ${inspectionData.buildingData.originalPurpose}',
          ),
          Paragraph(
            text:
                'Current Purpose of Building: ${inspectionData.buildingData.currentPurpose}',
          ),
          Paragraph(
            text:
                'Soil & Foundation Condition: ${inspectionData.buildingData.foundationCondition}',
          ),
          Header(
            text: 'Inspection Details',
          ),
          Paragraph(
            text:
                'Cause of Inspection: ${inspectionData.buildingData.inspectionCause?.inspectionCause ?? ''}',
          ),
          Paragraph(
            text:
                'Comment on Existing Problems: ${inspectionData.buildingData.problemComment}',
          ),
          Header(text: 'Room Inspection', level: 1),
          ..._generateRoomInspectionReport(
            doc.document,
            inspectionData.buildingData.rooms,
          ),
        ];
      },
    ),
  );
  doc.addPage(
    MultiPage(
      build: (context) {
        return [
          Header(
            text: 'Thanks',
          ),
          Paragraph(
              text:
                  'Thank you for requesting Skill Sewa Home Inspection Service of your residence. We are proud of our service, and trust that you will be happy with the quality of our report. We have made every effort to provide you with an accurate assessment of the condition of the property and its components and to alert you to any significant defects or adverse conditions. Therefore, you should not regard our inspection as conferring a guarantee or warranty. It is simply a report on the general condition of a particular property at a given point in time. Thank you for taking the time to read this report, and call us if you have any questions or observations whatsoever. We are always attempting to improve the quality of our service and our report, and we will continue to adhere to the highest standards of the industry and to treat everyone with kindness, courtesy, and respect.'),
          Paragraph(
              text:
                  'Skill Home Inspection Results: The residence was surveyed for Seepage in ground floor. Major Water leakage from Basin tap leading to serious destruction to Kitchen cabinet has been observed.'),
        ];
      },
    ),
  );
  doc.addPage(
    MultiPage(
      build: (context) {
        return [
          Header(
            text: 'Report Conclusion',
          ),
          Header(text: 'Service Recommendation:', level: 2),
          Paragraph(
              text:
                  'The findings in the report should be evaluated and corrected by a qualified and competent contractor who may discover additional repairs during the evaluation. Photos and images are a combination of specific and representative examples of issues detected during the inspection. After you have reviewed the report in detail, please contact me with any questions, comments or concerns.'),
          Paragraph(text: 'Chief Inspector Er.Mahesh Timilsina'),
          Paragraph(text: 'Phone No: 9801880051'),
          Paragraph(text: 'Bagmati Provience, Kathmandu, Baneshwor, Nepal'),
          Paragraph(text: 'http//:www.skillsewa.com'),
        ];
      },
    ),
  );
  return doc.save();
}
