import 'package:flutter/material.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';
import 'package:landing_app/ui/components/experience_widget/experience_model.dart';

class ExperienceWidget extends StatefulWidget {

  final ExperienceModel data;
  final bool? initiallyOpened;
  const ExperienceWidget({super.key, required this.data, this.initiallyOpened});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.data.companyName),
      initiallyExpanded: widget.initiallyOpened ?? true,
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            Text(widget.data.dateFormatted),
            verticalSpaceTiny,
            Text('Role: ${widget.data.role}'),
            verticalSpaceTiny,
            Text(widget.data.description),
            verticalSpaceTiny,
            Text('Skills: ${widget.data.skills}', style: const TextStyle(fontWeight: FontWeight.bold),),
            verticalSpaceTiny,
          ], 
        ),
      ],
    );
  }
}