import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/crud_sqflite/crud_sqflite_cubit.dart';
import 'package:flutter_application_1/data/models/note_models.dart';
import 'package:flutter_application_1/external/sizedbox_helper.dart';
import 'package:flutter_application_1/presentation/widgets/inputdecoration.dart';
import 'package:flutter_application_1/presentation/widgets/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Update extends StatefulWidget {
  Note? note;

  Update(this.note);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController? title;
  TextEditingController? desc;

  @override
  void initState() {
    super.initState();

    title = TextEditingController(text: widget.note!.title);
    desc = TextEditingController(text: widget.note!.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                validator: validateTitle,
                controller: title,
                decoration: inputDecoration('Title')),
            SpaceHelper.verticalSpaceMedium,
            TextFormField(
                validator: validateDesc,
                controller: desc,
                decoration: inputDecoration('Description')),
            BlocListener<CrudSqfliteCubit, CrudSqfliteState>(
              listener: (context, state) {
                if (state is UpdateSqfliteLoading) {
                  print('laodig');
                } else if (state is UpdateSqfliteSuccess) {
                  print('succcess');
                } else if (state is UpdateSqfliteFailed) {
                  print('failed');
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    // primary: isFormValid ? null : Colors.grey.shade700,
                  ),
                  onPressed: () {
                    CrudSqfliteCubit crudSqfliteCubit =
                        BlocProvider.of<CrudSqfliteCubit>(context);

                    crudSqfliteCubit.updateNote(Note(
                      // id: widget.note!.id,
                      title: '${title!.text}',
                      desc: '${desc!.text}',
                    ));
                  },
                  child: Text('Edit'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
