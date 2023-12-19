import 'package:flutter/material.dart';
import 'package:landing_app/ui/common/ui_helpers.dart';
import 'package:landing_app/ui/components/experience_widget/experience_model.dart';

class ExperienceWidget extends StatefulWidget {

  final ExperienceModel data;
  const ExperienceWidget({super.key, required this.data});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.data.companyName),
      initiallyExpanded: false,
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        verticalSpaceSmall,
        Text(widget.data.dateFormatted),
        verticalSpaceTiny,
        Text('Role: ${widget.data.role}'),
        verticalSpaceTiny,
        Text(widget.data.description),
        verticalSpaceTiny,
        Text('Skills: ${widget.data.skills}'),
        verticalSpaceTiny,
      ],
    );
  }
}