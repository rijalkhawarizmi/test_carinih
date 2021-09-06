import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/crud_sqflite/crud_sqflite_cubit.dart';
import 'package:flutter_application_1/data/models/note_models.dart';
import 'package:flutter_application_1/external/color_helper.dart';
import 'package:flutter_application_1/external/sizedbox_helper.dart';
import 'package:flutter_application_1/presentation/widgets/inputdecoration.dart';
import 'package:flutter_application_1/presentation/widgets/toast.dart';
import 'package:flutter_application_1/presentation/widgets/validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Create extends StatelessWidget {
  Note? note;

  final title = TextEditingController();
  final desc = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    CrudSqfliteCubit crudSqfliteCubit =
        BlocProvider.of<CrudSqfliteCubit>(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
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
                    if (state is CreateSqfliteLoading) {
                     
                    } else if (state is CreateSqfliteSuccess) {
                      crudSqfliteCubit.fetchNote();
                     ToastWidget().toast(
                                    'Success Create', kColorGreenAccent);
                    } else if (state is CreateSqfliteFailed) {
                      ToastWidget().toast(
                                    'Failed', kColorPink);
                    }
                  },
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      
                      // primary: isFormValid ? null : Colors.grey.shade700,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        final data = Note(title: title.text, desc: desc.text);

                        crudSqfliteCubit.createNote(data);
                      }
                    },
                    child: Text('Save'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
