import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyGrades extends StatelessWidget with NavigationStates {
    @override
    Widget build(BuildContext context){
     return Scaffold(
         appBar: AppBar(
             title: Text('My Grades'),
         ),
        body:   Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                DataTable(
                columns: [
                    
                    DataColumn(label: Text('Subject')),
                    DataColumn(label: Text('Mid Grade')),
                    DataColumn(label: Text('Final Grade')),
                    ],
                rows: [
                    DataRow(cells: [
                        DataCell(Text('Free Elect 3')),
                        DataCell(Text('2.75')),
                        DataCell(Text('3.0')),
                    ]),
                    DataRow(cells: [
                        DataCell(Text('IT Elect 4')),
                        DataCell(Text('3.75')),
                        DataCell(Text('3.0')),
                    ]),
                    DataRow(cells: [
                        DataCell(Text('PH History')),
                        DataCell(Text('3.0')),
                        DataCell(Text('2.0')),
                    ]),
                    DataRow(cells: [
                        DataCell(Text('Gen Econ')),
                        DataCell(Text('2.5')),
                        DataCell(Text('3.0')),
                    ]),
                    DataRow(cells: [
                        DataCell(Text('Applied Psychology')),
                        DataCell(Text('2.1')),
                        DataCell(Text('2.5')),
                    ]),
                    DataRow(cells: [
                        DataCell(Text('Cisco 4')),
                        DataCell(Text('3.75')),
                        DataCell(Text('3.0')),
                    ]),
                ],),
            ],),
       
        );
    }
}