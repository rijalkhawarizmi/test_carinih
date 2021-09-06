import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/bloc/crud_sqflite/crud_sqflite_cubit.dart';
import 'package:flutter_application_1/data/models/note_models.dart';
import 'package:flutter_application_1/external/color_helper.dart';
import 'package:flutter_application_1/presentation/pages/crud_local_page/page/create.dart';
import 'package:flutter_application_1/presentation/pages/crud_local_page/page/update.dart';
import 'package:flutter_application_1/presentation/widgets/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudLocalPage extends StatelessWidget {
  List<Note> listNote = [];
  @override
  Widget build(BuildContext context) {
    CrudSqfliteCubit crudSqfliteCubit =
        BlocProvider.of<CrudSqfliteCubit>(context);
    crudSqfliteCubit.fetchNote();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return Create();
          }));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: BlocBuilder<CrudSqfliteCubit, CrudSqfliteState>(
          builder: (context, state) {
            if (state is FetchSqfliteLoading) {
              return CircularProgressIndicator();
            } else if (state is FetchSqfliteSuccess) {
              listNote = state.listNote;
            } else if (state is FetchSqfliteFailed) {
              return Center(child: Text('${state.messageFailed}'));
            }
            return ListView.builder(
              itemCount: listNote.length,
              itemBuilder: (BuildContext context, int index) {
                final list = listNote[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${list.title}',
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            '${list.desc}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                        
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (c) {
                                  return Update(list);
                                }));
                              }),
                          BlocListener<CrudSqfliteCubit, CrudSqfliteState>(
                            listener: (context, state) {
                              if (state is DeleteSqfliteLoading) {
                            
                              } else if (state is DeleteSqfliteSuccess) {
                                ToastWidget().toast(
                                    'Success deleted', kColorGreenAccent);
                                crudSqfliteCubit.fetchNote();
                              } else if (state is DeleteSqfliteFailed) {
                                ToastWidget().toast('Failed', kColorPink);
                              }
                            },
                            child: IconButton(
                                icon: Icon(Icons.delete,color: kColorPink,),
                                onPressed: () {
                                  crudSqfliteCubit.deleteNote(list.id);
                                }),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
