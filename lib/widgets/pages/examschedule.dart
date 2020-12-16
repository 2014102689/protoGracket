import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class ExamSched extends StatelessWidget with NavigationStates {
    @override
    Widget build(BuildContext context){
        return Scaffold(
         appBar: AppBar(
             title: Text('Exam Schedule'),
         ),
        body:   Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                DataTable(
                columns: [
                    DataColumn(label: Text('Exam')),
                    DataColumn(label: Text('Month')),
                    DataColumn(label: Text('Day')),
                    ],
                rows: [
                    DataRow(cells: [
                        DataCell(Text('Prelim')),
                        DataCell(Text('January')),
                        DataCell(Text('7th-12th')),
                    ],),
                    DataRow(cells: [
                        DataCell(Text('Midterm')),
                        DataCell(Text('February')),
                        DataCell(Text('21th-28th')),
                    ],),
                    DataRow(cells: [
                        DataCell(Text('Sem-Final')),
                        DataCell(Text('March')),
                        DataCell(Text('15th-21th')),
                    ],),
                    DataRow(cells: [
                        DataCell(Text('Finals')),
                        DataCell(Text('May')),
                        DataCell(Text('3rd-9th')),
                    ],),
                ],),
            ],),
        );
    }
}