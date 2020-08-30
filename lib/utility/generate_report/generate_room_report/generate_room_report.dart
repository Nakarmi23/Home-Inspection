part of '../generate_report.dart';

List<Widget> _generateRoomInspectionReport(PdfDocument doc, List<Room> rooms) {
  return rooms.map((room) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Header(
          text: '${room.storeyNo}/${room.roomNo}/${room.roomPurpose.purpose}',
          level: 2,
        ),
        ..._generateStructuralInspectionReport(doc, room.structuralInspection),
        ..._generateWaterQualityReport(doc, room.waterQualities),
        ..._generateLuxmeterReadingReport(doc, room.luxmeterReadings),
        ..._generateSeepageAnalysisReport(doc, room.seepageAnalysis),
        ..._generateMinorChecksReport(doc, room.minorChecks),
        ..._generateKitchenInspectionReport(doc, room.kitchenInspection),
        ..._generateToiletInspectionReport(doc, room.toiletInspection),
        ..._generateStaircaseInspectionReport(doc, room.staircaseInspection),
      ],
    );
  }).toList();
}

List<Widget> _generateStructuralInspectionReport(
    PdfDocument doc, StructuralInspection structuralInspectionData) {
  return structuralInspectionData != null
      ? [
          Header(
            text: 'Structural Inspection',
            level: 3,
          ),
          ..._generateVisualInspectionReport(
              doc, structuralInspectionData.visualInspection),
          ..._generateNonDestructiveTestReport(
              doc, structuralInspectionData.nonDestructiveTest),
        ]
      : [];
}

List<Widget> _generateVisualInspectionReport(
    PdfDocument doc, VisualInspection visualInspectionData) {
  return visualInspectionData != null
      ? [
          Header(
            text: 'Visual Inspection Checklist',
            level: 4,
          ),
          Paragraph(text: 'Location: ${visualInspectionData?.location}'),
          Header(
            text: 'Spalling',
            level: 5,
          ),
          generateImageGrid(doc, visualInspectionData.spalling.photos),
          Paragraph(
            text: 'Comment: ${visualInspectionData.spalling?.comment}',
          ),
          Header(
            text: 'Cracking',
            level: 5,
          ),
          generateImageGrid(doc, visualInspectionData.cracking.photos),
          Paragraph(
            text: 'Comment: ${visualInspectionData.cracking?.comment}',
          ),
          Header(
            text: 'Bulging',
            level: 5,
          ),
          generateImageGrid(doc, visualInspectionData.bulging.photos),
          Paragraph(
            text: 'Comment: ${visualInspectionData.bulging?.comment}',
          ),
          Header(
            text: 'Tilting',
            level: 5,
          ),
          generateImageGrid(doc, visualInspectionData.tilting.photos),
          Paragraph(
            text: 'Comment: ${visualInspectionData.tilting?.comment}',
          ),
          ...visualInspectionData.otherProblems
              .map(
                (problem) => Column(
                  children: [
                    Header(
                      text: problem.name,
                      level: 5,
                    ),
                    generateImageGrid(
                      doc,
                      problem.photos,
                    ),
                  ],
                ),
              )
              .toList(),
        ]
      : [];
}

List<Widget> _generateNonDestructiveTestReport(
    PdfDocument doc, NonDestructiveTest nonDestructiveTestData) {
  return nonDestructiveTestData != null
      ? [
          Header(
            text: 'Non Destructive Test',
            level: 4,
          ),
          Paragraph(
            text:
                'Element of Structure: ${nonDestructiveTestData.structureElement}',
          ),
          Paragraph(
            text: 'Concrete Grade: ${nonDestructiveTestData.concreteGrade}',
          ),
          Paragraph(
            text:
                'Direction of Impact: ${nonDestructiveTestData.impactDirection}',
          ),
          Paragraph(
            text: 'location: ${nonDestructiveTestData.location}',
          ),
          generateImageGrid(
            doc,
            nonDestructiveTestData.photoSchmidtHammer ?? [],
          ),
          Header(
            text: 'Principle of Rebound Hammer',
            level: 5,
          ),
          Paragraph(
            text:
                'Rebound hammer test method is based on the principle that the rebound of an elastic mass depends on the hardness of the concrete surface against which the mass strikes. The operation of the rebound hammer is shown in above figure. When the plunger of rebound hammer is pressed against the concrete surface, the spring controlled mass in the hammer rebounds. The amount of rebound of the mass depends on the hardness of concrete surface.',
          ),
          Paragraph(
            text:
                'Thus, the hardness of concrete and rebound hammer reading can be correlated with compressive strength of concrete. The rebound  value  is  read  off  along  a  graduated  scale  and is designated  as  the rebound  number  or  rebound  index.  The  compressive strength can be  read directly from the graph provided on the body of the hammer',
          ),
          Paragraph(
            text: 'Reading',
          ),
          Table.fromTextArray(
            data: [
              ['S.N.', 'Readings'],
              ...(nonDestructiveTestData.readings ?? [])
                  ?.asMap()
                  ?.keys
                  ?.map((readingIndex) => [
                        (readingIndex + 1).toString(),
                        nonDestructiveTestData.readings[readingIndex].toString()
                      ])
                  ?.toList(),
            ],
          ),
          Paragraph(text: 'Preference Table for Rebound Numbers:'),
          Table.fromTextArray(
            data: [
              ['Average Rebound Number', 'Quality of Concrete'],
              ['> 40', 'Very good hard layer'],
              ['30 to 40', 'Good layer'],
              ['20 to 30', 'Fair'],
              ['< 20', 'Poor Concrete'],
              ['0', 'Delaminated']
            ],
          ),
        ]
      : [];
}

List<Widget> _generateWaterQualityReport(
    PdfDocument doc, List<WaterQuality> waterQualityData) {
  return waterQualityData.isNotEmpty
      ? [
          Header(
            text: 'Water Quality Inspection',
            level: 3,
          ),
          ...waterQualityData
              .asMap()
              .keys
              .map(
                (waterQualityIndex) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      text: 'Water Quality Sample ${waterQualityIndex + 1}',
                      level: 4,
                    ),
                    generateImageGrid(
                        doc, waterQualityData[waterQualityIndex].photos),
                    Paragraph(
                        text:
                            'Sample Source: ${waterQualityData[waterQualityIndex].source}'),
                    Header(
                      text:
                          'Water Quality Sample ${waterQualityData[waterQualityIndex].sampleNo}',
                      level: 5,
                    ),
                    Table.fromTextArray(
                      data: [
                        [
                          'S.N',
                          'Parameters',
                          'Units',
                          'Readings',
                          'NDWQS',
                          'Test Methods',
                        ],
                        [
                          '1',
                          'Teamperature',
                          'C',
                          waterQualityData[waterQualityIndex].temperature ?? '',
                          '-',
                          'IR Thermometer',
                        ],
                        [
                          '2',
                          'Colour',
                          '-',
                          waterQualityData[waterQualityIndex].color ?? '',
                          '-',
                          'Visual Inspection',
                        ],
                        [
                          '3',
                          'Taste',
                          '-',
                          waterQualityData[waterQualityIndex].taste ?? '',
                          'Non Objectionable',
                          '',
                        ],
                        [
                          '4',
                          'Odour',
                          '-',
                          waterQualityData[waterQualityIndex].odour ?? '',
                          'Non Objectionable',
                          '',
                        ],
                        [
                          '5',
                          'PH Value',
                          '-',
                          waterQualityData[waterQualityIndex].phValue ?? '',
                          '6.5-8.5',
                          'PH Meter',
                        ],
                        [
                          '6',
                          'Turbidity',
                          'NTU',
                          waterQualityData[waterQualityIndex].turbidity ?? '',
                          '5 (10)',
                          'Nephelometric Method',
                        ],
                        [
                          '7',
                          'EC meter Reading',
                          '-',
                          waterQualityData[waterQualityIndex].ecMeterReading ??
                              '',
                          '-',
                          'EC Meter',
                        ],
                        [
                          '8',
                          'TDS meter Reading',
                          '-',
                          waterQualityData[waterQualityIndex].tdsMeterReading ??
                              '',
                          '-',
                          'TDS Meter',
                        ],
                        [
                          '9',
                          'Chlorine Meter Reading',
                          'Mg/1',
                          waterQualityData[waterQualityIndex]
                                  .chlorineMeterReading ??
                              '',
                          '250',
                          'Chloroscope',
                        ],
                      ],
                    ),
                  ],
                ),
              )
              .toList(),
        ]
      : [];
}

List<Widget> _generateLuxmeterReadingReport(
    PdfDocument doc, List<LuxmeterReading> luxmeterReadingList) {
  return luxmeterReadingList.isNotEmpty
      ? [
          Header(text: 'Luxmeter Reading', level: 3),
          ...luxmeterReadingList
              .asMap()
              .keys
              .map(
                (luxmeterReadingIndex) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                        text: 'Luxmeter Reading ${luxmeterReadingIndex + 1}',
                        level: 4),
                    generateImageGrid(
                        doc, luxmeterReadingList[luxmeterReadingIndex].photos),
                    Paragraph(
                        text:
                            'Sample Source: ${luxmeterReadingList[luxmeterReadingIndex].source}'),
                    Paragraph(text: 'Readings'),
                    Table.fromTextArray(
                      data: [
                        ['S.N.', 'Readings'],
                        ...luxmeterReadingList[luxmeterReadingIndex]
                            .readings
                            .asMap()
                            .keys
                            .map(
                              (readingIndex) => [
                                (readingIndex + 1).toString(),
                                luxmeterReadingList[luxmeterReadingIndex]
                                    .readings[readingIndex]
                              ],
                            ),
                        [
                          'Average Value',
                          (double.parse(
                                      luxmeterReadingList[luxmeterReadingIndex]
                                          .readings
                                          .reduce((a, b) => (double.parse(a) +
                                                  double.parse(b))
                                              .toString())) /
                                  luxmeterReadingList[luxmeterReadingIndex]
                                      .readings
                                      .length)
                              .toString()
                        ],
                      ],
                    ),
                  ],
                ),
              )
              .toList(),
        ]
      : [];
}

List<Widget> _generateSeepageAnalysisReport(
    PdfDocument doc, List<SeepageAnalysis> seepageAnalysisList) {
  return seepageAnalysisList.isNotEmpty
      ? [
          Header(text: 'Seepage Analysis', level: 3),
          ...seepageAnalysisList.asMap().keys.map(
            (seepageAnalysisIndex) {
              final seepageAnalysis = seepageAnalysisList[seepageAnalysisIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Header(
                      text: 'Seepage Analysis ${seepageAnalysisIndex + 1}',
                      level: 4),
                  Paragraph(
                      text: 'Temperature: ${seepageAnalysis.temperature}'),
                  Paragraph(text: 'Temperature: ${seepageAnalysis.condition}'),
                  generateImageGrid(doc, seepageAnalysis.photosNormal),
                  Paragraph(text: 'Readings'),
                  Table.fromTextArray(
                    data: [
                      ['S.N.', 'Readings'],
                      ...seepageAnalysis.readings.asMap().keys.map(
                            (readingIndex) => [
                              (readingIndex + 1).toString(),
                              seepageAnalysis.readings[readingIndex]
                            ],
                          ),
                      [
                        'Average Value',
                        (double.parse(seepageAnalysis.readings.reduce((a, b) =>
                                    (double.parse(a) + double.parse(b))
                                        .toString())) /
                                seepageAnalysis.readings.length)
                            .toString()
                      ],
                    ],
                  ),
                  Paragraph(text: 'Digital Level:'),
                  generateImageGrid(doc, seepageAnalysis.photosDigitalLevel),
                  Paragraph(
                      text:
                          'Comments: ${seepageAnalysis.commentsDigitalLevel}'),
                  Paragraph(text: 'IR Thermal Imaging:'),
                  generateImageGrid(doc, seepageAnalysis.photosThermal),
                  Paragraph(text: 'Moisture Meter:'),
                  generateImageGrid(doc, seepageAnalysis.photosMoistureMeter),
                ],
              );
            },
          ).toList(),
        ]
      : [];
}

List<Widget> _generateMinorChecksReport(
    PdfDocument doc, MinorChecks minorChecks) {
  return minorChecks != null
      ? [
          Header(text: 'Skill Sewa General Inspection Checks', level: 3),
          ..._generateDoorCheckListReport(doc, minorChecks.doors),
          ..._generateWindowCheckListReport(doc, minorChecks.window),
          ..._generateCeilingCheckListReport(doc, minorChecks.ceiling),
          ..._generateWallCheckListReport(doc, minorChecks.wall),
          ..._generateElectricalFittingCheckListReport(
              doc, minorChecks.electricalFitting),
          ..._generatePestInspectionCheckListReport(
              doc, minorChecks.pestInspection),
          ..._generateWoodWorkCheckListReport(doc, minorChecks.carpentry),
          ..._generateMetalAlumuniumCheckListReport(
              doc, minorChecks.metalAluminiumWork),
          ..._generateCleaningCheckListReport(doc, minorChecks.cleaning),
        ]
      : [];
}

List<Widget> _generateDoorCheckListReport(
    PdfDocument doc, List<Door> doorsCheckList) {
  return doorsCheckList.isNotEmpty
      ? [
          Header(text: 'Door Inspection Checks', level: 4),
          ...doorsCheckList.asMap().keys.map((doorIndex) {
            final door = doorsCheckList[doorIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Door ${doorIndex + 1}', level: 5),
                Paragraph(text: 'Door Material: ${door.material}'),
                Header(text: 'Door Frames', level: 6),
                Paragraph(
                    text: 'Condition: ${door.doorFramesCondition.condition}'),
                generateImageGrid(doc, door.doorFramesCondition.photos),
                Paragraph(text: 'Comment: ${door.doorFramesCondition.comment}'),
                Header(text: 'Door Panels', level: 6),
                Paragraph(
                    text: 'Condition: ${door.doorPanelsCondition.condition}'),
                generateImageGrid(doc, door.doorPanelsCondition.photos),
                Paragraph(text: 'Comment: ${door.doorPanelsCondition.comment}'),
                Header(text: 'Hinges', level: 6),
                Paragraph(text: 'Condition: ${door.hingesCondition.condition}'),
                generateImageGrid(doc, door.hingesCondition.photos),
                Paragraph(text: 'Comment: ${door.hingesCondition.comment}'),
                Header(text: 'Holder', level: 6),
                Paragraph(text: 'Condition: ${door.holderCondition.condition}'),
                generateImageGrid(doc, door.holderCondition.photos),
                Paragraph(text: 'Comment: ${door.holderCondition.comment}'),
                ...door.otherFixturesCondition
                    .map(
                      (fixture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Header(text: fixture.otherFixtureName, level: 6),
                          Paragraph(text: 'Condition: ${fixture.condition}'),
                          generateImageGrid(doc, fixture.photos),
                          Paragraph(text: 'Comment: ${fixture.comment}'),
                        ],
                      ),
                    )
                    .toList(),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateWindowCheckListReport(
    PdfDocument doc, List<Window> windowCheckList) {
  return windowCheckList.isNotEmpty
      ? [
          Header(text: 'Window Inspection Checks', level: 4),
          ...windowCheckList.asMap().keys.map((windowIndex) {
            final window = windowCheckList[windowIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Window ${windowIndex + 1}', level: 5),
                Paragraph(text: 'Window Material: ${window.material}'),
                Header(text: 'Window Frames', level: 6),
                Paragraph(
                    text:
                        'Condition: ${window.windowFramesCondition.condition}'),
                generateImageGrid(doc, window.windowFramesCondition.photos),
                Paragraph(
                    text: 'Comment: ${window.windowFramesCondition.comment}'),
                Header(text: 'Window Panels', level: 6),
                Paragraph(
                    text:
                        'Condition: ${window.windowPanelsCondition.condition}'),
                generateImageGrid(doc, window.windowPanelsCondition.photos),
                Paragraph(
                    text: 'Comment: ${window.windowPanelsCondition.comment}'),
                Header(text: 'Hinges', level: 6),
                Paragraph(
                    text: 'Condition: ${window.hingesCondition.condition}'),
                generateImageGrid(doc, window.hingesCondition.photos),
                Paragraph(text: 'Comment: ${window.hingesCondition.comment}'),
                Header(text: 'Holder', level: 6),
                Paragraph(
                    text: 'Condition: ${window.holderCondition.condition}'),
                generateImageGrid(doc, window.holderCondition.photos),
                Paragraph(text: 'Comment: ${window.holderCondition.comment}'),
                ...window.otherFixturesCondition
                    .map(
                      (fixture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Header(text: fixture.otherFixtureName, level: 6),
                          Paragraph(text: 'Condition: ${fixture.condition}'),
                          generateImageGrid(doc, fixture.photos),
                          Paragraph(text: 'Comment: ${fixture.comment}'),
                        ],
                      ),
                    )
                    .toList(),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateCeilingCheckListReport(
    PdfDocument doc, List<Ceiling> ceilingCheckList) {
  return ceilingCheckList.isNotEmpty
      ? [
          Header(text: 'Ceiling Inspection Checks', level: 4),
          ...ceilingCheckList.asMap().keys.map((ceilingIndex) {
            final ceiling = ceilingCheckList[ceilingIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Ceiling ${ceilingIndex + 1}', level: 5),
                Header(text: 'Painting', level: 6),
                Paragraph(
                    text: 'Condition: ${ceiling.paintingCondition.condition}'),
                generateImageGrid(doc, ceiling.paintingCondition.photos),
                Paragraph(
                    text: 'Comment: ${ceiling.paintingCondition.comment}'),
                Header(text: 'Plastering', level: 6),
                Paragraph(
                    text:
                        'Condition: ${ceiling.plasteringCondition.condition}'),
                generateImageGrid(doc, ceiling.plasteringCondition.photos),
                Paragraph(
                    text: 'Comment: ${ceiling.plasteringCondition.comment}'),
                Header(text: 'False Ceiling', level: 6),
                Paragraph(
                    text:
                        'Condition: ${ceiling.falseCeilingsCondition.condition}'),
                generateImageGrid(doc, ceiling.falseCeilingsCondition.photos),
                Paragraph(
                    text: 'Comment: ${ceiling.falseCeilingsCondition.comment}'),
                Header(text: 'Mason Problems', level: 6),
                Paragraph(
                    text:
                        'Condition: ${ceiling.masonProblemCondition.condition}'),
                generateImageGrid(doc, ceiling.masonProblemCondition.photos),
                Paragraph(
                    text: 'Comment: ${ceiling.masonProblemCondition.comment}'),
                ...ceiling.otherProblemCondition
                    .map(
                      (fixture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Header(text: fixture.otherFixtureName, level: 6),
                          Paragraph(text: 'Condition: ${fixture.condition}'),
                          generateImageGrid(doc, fixture.photos),
                          Paragraph(text: 'Comment: ${fixture.comment}'),
                        ],
                      ),
                    )
                    .toList(),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateWallCheckListReport(
    PdfDocument doc, List<Wall> wallCheckList) {
  return wallCheckList.isNotEmpty
      ? [
          Header(text: 'Wall Inspection Checks', level: 4),
          ...wallCheckList.asMap().keys.map((wallIndex) {
            final wall = wallCheckList[wallIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Wall ${wallIndex + 1}', level: 5),
                Header(text: 'Painting', level: 6),
                Paragraph(
                    text: 'Condition: ${wall.paintingCondition.condition}'),
                generateImageGrid(doc, wall.paintingCondition.photos),
                Paragraph(text: 'Comment: ${wall.paintingCondition.comment}'),
                Header(text: 'Plastering', level: 6),
                Paragraph(
                    text: 'Condition: ${wall.plasteringCondition.condition}'),
                generateImageGrid(doc, wall.plasteringCondition.photos),
                Paragraph(text: 'Comment: ${wall.plasteringCondition.comment}'),
                Header(text: 'Mason Problems', level: 6),
                Paragraph(
                    text: 'Condition: ${wall.masonProblemCondition.condition}'),
                generateImageGrid(doc, wall.masonProblemCondition.photos),
                Paragraph(
                    text: 'Comment: ${wall.masonProblemCondition.comment}'),
                ...wall.otherProblemCondition
                    .map(
                      (fixture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Header(text: fixture.otherFixtureName, level: 6),
                          Paragraph(text: 'Condition: ${fixture.condition}'),
                          generateImageGrid(doc, fixture.photos),
                          Paragraph(text: 'Comment: ${fixture.comment}'),
                        ],
                      ),
                    )
                    .toList(),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateElectricalFittingCheckListReport(
    PdfDocument doc, List<ElectricalFitting> electricalFittingList) {
  return electricalFittingList.isNotEmpty
      ? [
          Header(text: 'Electrical Fitting Inspection Checks', level: 4),
          ...electricalFittingList.asMap().keys.map((electricalFittingIndex) {
            final electricalFitting =
                electricalFittingList[electricalFittingIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                    text: 'Electrical Fitting ${electricalFittingIndex + 1}',
                    level: 5),
                Header(text: 'Wirings', level: 6),
                Paragraph(
                    text:
                        'Condition: ${electricalFitting.wiringCondition.condition}'),
                generateImageGrid(
                    doc, electricalFitting.wiringCondition.photos),
                Paragraph(
                    text:
                        'Comment: ${electricalFitting.wiringCondition.comment}'),
                Header(text: 'Switches', level: 6),
                Paragraph(
                    text:
                        'Condition: ${electricalFitting.switchesCondition.condition}'),
                generateImageGrid(
                    doc, electricalFitting.switchesCondition.photos),
                Paragraph(
                    text:
                        'Comment: ${electricalFitting.switchesCondition.comment}'),
                Header(text: 'Lights', level: 6),
                Paragraph(
                    text:
                        'Condition: ${electricalFitting.lightsCondition.condition}'),
                generateImageGrid(
                    doc, electricalFitting.lightsCondition.photos),
                Paragraph(
                    text:
                        'Comment: ${electricalFitting.lightsCondition.comment}'),
                Header(text: 'Ceiling Fans', level: 6),
                Paragraph(
                    text:
                        'Condition: ${electricalFitting.ceilingFanCondition.condition}'),
                generateImageGrid(
                    doc, electricalFitting.ceilingFanCondition.photos),
                Paragraph(
                    text:
                        'Comment: ${electricalFitting.ceilingFanCondition.comment}'),
                ...electricalFitting.otherAccessoriesCondition
                    .map(
                      (fixture) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Header(text: fixture.otherFixtureName, level: 6),
                          Paragraph(text: 'Condition: ${fixture.condition}'),
                          generateImageGrid(doc, fixture.photos),
                          Paragraph(text: 'Comment: ${fixture.comment}'),
                        ],
                      ),
                    )
                    .toList(),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generatePestInspectionCheckListReport(
    PdfDocument doc, List<PestInspection> pestInspectionCheckList) {
  return pestInspectionCheckList.isNotEmpty
      ? [
          Header(text: 'Pest Inspection Checks', level: 4),
          ...pestInspectionCheckList.asMap().keys.map((pestInspectionIndex) {
            final pestInspection = pestInspectionCheckList[pestInspectionIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                    text: 'Pest Inspection ${pestInspectionIndex + 1}',
                    level: 5),
                Paragraph(
                    text:
                        'Surrounding Condition: ${pestInspection.surroundingCondition}'),
                generateImageGrid(doc, pestInspection.photos),
                Paragraph(text: 'Comment: ${pestInspection.comment}'),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateWoodWorkCheckListReport(
    PdfDocument doc, List<ImageAndComment> woodWorkInspectionCheckList) {
  return woodWorkInspectionCheckList.isNotEmpty
      ? [
          Header(text: 'Wood Work Inspection Checks', level: 4),
          ...woodWorkInspectionCheckList
              .asMap()
              .keys
              .map((woodWorkInspectionIndex) {
            final woodWork =
                woodWorkInspectionCheckList[woodWorkInspectionIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                    text: 'Wood Work ${woodWorkInspectionIndex + 1}', level: 5),
                generateImageGrid(doc, woodWork.photos),
                Paragraph(text: 'Comment: ${woodWork.comment}'),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateMetalAlumuniumCheckListReport(PdfDocument doc,
    List<ImageAndComment> metalAlumuniumWorkInspectionCheckList) {
  return metalAlumuniumWorkInspectionCheckList.isNotEmpty
      ? [
          Header(text: 'Metal & Alumunium Work Inspection Checks', level: 4),
          ...metalAlumuniumWorkInspectionCheckList
              .asMap()
              .keys
              .map((metalAlumuniumWorkIndex) {
            final metalAlumuniumWork =
                metalAlumuniumWorkInspectionCheckList[metalAlumuniumWorkIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(
                    text:
                        'Metal & Alumunium Work ${metalAlumuniumWorkIndex + 1}',
                    level: 5),
                generateImageGrid(doc, metalAlumuniumWork.photos),
                Paragraph(text: 'Comment: ${metalAlumuniumWork.comment}'),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateCleaningCheckListReport(
    PdfDocument doc, List<ImageAndComment> cleaningInspectionCheckList) {
  return cleaningInspectionCheckList.isNotEmpty
      ? [
          Header(text: 'Metal & Alumunium Work Inspection Checks', level: 4),
          ...cleaningInspectionCheckList.asMap().keys.map((cleaningIndex) {
            final cleaning = cleaningInspectionCheckList[cleaningIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Cleaning ${cleaningIndex + 1}', level: 5),
                generateImageGrid(doc, cleaning.photos),
                Paragraph(text: 'Comment: ${cleaning.comment}'),
              ],
            );
          }).toList(),
        ]
      : [];
}

List<Widget> _generateKitchenInspectionReport(
    PdfDocument doc, KitchenInspection kitchenInspection) {
  return kitchenInspection != null
      ? [
          Header(text: 'Kitchen Inspection Checklist', level: 3),
          Header(text: 'Kitchen Cabinet', level: 4),
          Paragraph(
              text: 'Material: ${kitchenInspection.kitchenCabinet.material}'),
          generateImageGrid(doc, kitchenInspection.kitchenCabinet.photos),
          Paragraph(
              text: 'Comment: ${kitchenInspection.kitchenCabinet.comment}'),
          Header(text: 'Dish Washer', level: 4),
          generateImageGrid(doc, kitchenInspection.dishWasher.photos),
          Paragraph(text: 'Comment: ${kitchenInspection.dishWasher.comment}'),
          Header(text: 'Garbage Disposal', level: 4),
          generateImageGrid(doc, kitchenInspection.garbageDisposal.photos),
          Paragraph(
              text: 'Comment: ${kitchenInspection.garbageDisposal.comment}'),
          Header(text: 'Kitchen Sink', level: 4),
          generateImageGrid(doc, kitchenInspection.kitchenSink.photos),
          Paragraph(text: 'Comment: ${kitchenInspection.kitchenSink.comment}'),
          Header(text: 'Gas and Gas Stove', level: 4),
          generateImageGrid(doc, kitchenInspection.gasAndGasStove.photos),
          Paragraph(
              text: 'Comment: ${kitchenInspection.gasAndGasStove.comment}'),
          Header(text: 'Plumbing', level: 4),
          generateImageGrid(doc, kitchenInspection.plumbing.photos),
          Paragraph(text: 'Comment: ${kitchenInspection.plumbing.comment}'),
        ]
      : [];
}

List<Widget> _generateToiletInspectionReport(
    PdfDocument doc, ToiletInspection toiletInspectionInspection) {
  return toiletInspectionInspection != null
      ? [
          Header(text: 'Toilet Inspection Checklist', level: 3),
          Header(text: 'Wash Basin', level: 4),
          generateImageGrid(doc, toiletInspectionInspection.washBasin.photos),
          Paragraph(
              text: 'Comment: ${toiletInspectionInspection.washBasin.comment}'),
          Header(text: 'Mirror', level: 4),
          generateImageGrid(doc, toiletInspectionInspection.mirror.photos),
          Paragraph(
              text: 'Comment: ${toiletInspectionInspection.mirror.comment}'),
          Header(text: 'Water Closet', level: 4),
          generateImageGrid(doc, toiletInspectionInspection.waterCloset.photos),
          Paragraph(
              text:
                  'Comment: ${toiletInspectionInspection.waterCloset.comment}'),
          Header(text: 'Flush', level: 4),
          generateImageGrid(doc, toiletInspectionInspection.flush.photos),
          Paragraph(
              text: 'Comment: ${toiletInspectionInspection.flush.comment}'),
          Header(text: 'Plumbing', level: 4),
          generateImageGrid(doc, toiletInspectionInspection.plumbing.photos),
          Paragraph(
              text: 'Comment: ${toiletInspectionInspection.plumbing.comment}'),
        ]
      : [];
}

List<Widget> _generateStaircaseInspectionReport(
    PdfDocument doc, List<StaircaseInspection> staircaseInspection) {
  return staircaseInspection.isNotEmpty
      ? [
          Header(text: 'Staircase Inspection Checklist', level: 3),
          ...staircaseInspection.asMap().keys.map((staircaseIndex) {
            final staircase = staircaseInspection[staircaseIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(text: 'Staircase ${staircaseIndex + 1}', level: 4),
                Paragraph(text: 'Location: ${staircase.location}'),
                Paragraph(text: 'Type: ${staircase.type}'),
                Paragraph(text: 'Material: ${staircase.material}'),
                Paragraph(text: 'Clearance Condition:'),
                generateImageGrid(doc, staircase.clearanceCondition.photos),
                Paragraph(
                    text: 'Comment: ${staircase.clearanceCondition.comment}'),
                Paragraph(text: 'Railing Condition:'),
                generateImageGrid(doc, staircase.railing.photos),
                Paragraph(text: 'Comment: ${staircase.railing.comment}'),
                Paragraph(
                    text:
                        'Functionality of Riser, Tread and Width of Staircase:'),
                generateImageGrid(doc, staircase.functionality.photos),
                Paragraph(text: 'Comment: ${staircase.functionality.comment}'),
              ],
            );
          }).toList(),
        ]
      : [];
}
