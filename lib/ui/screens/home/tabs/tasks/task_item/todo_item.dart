import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/cores/utils/app_styles.dart';
import 'package:todo_app/cores/utils/colors_manager.dart';
import 'package:todo_app/database_manager/model/todo_dm.dart';
import 'package:todo_app/database_manager/model/user_DM.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, required this.onDeletedTask});

  final TodoDM todo;
  final Function onDeletedTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .3,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              flex: 2,
              onPressed: (context) {
                deleteTodoFromFireStore(todo);
                onDeletedTask();
              },
              backgroundColor: ColorsManager.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              flex: 2,
              onPressed: (context) {
                showEditDialog(context);
              },
              backgroundColor: ColorsManager.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 7),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    todo.title,
                    style: LightAppStyle.todoTitle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    todo.description,
                    style: LightAppStyle.todoDesc,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check,
                  color: ColorsManager.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteTodoFromFireStore(TodoDM todo) async {
    print('enter delete function');
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.delete();
  }

  void editTodoInFirestore(TodoDM todo) async {
    CollectionReference todoCollection = FirebaseFirestore.instance
        .collection(UserDM.collectionName)
        .doc(UserDM.currentUser!.id)
        .collection(TodoDM.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);

    await todoDoc.update({
      'title': todo.title,
      'description': todo.description,
    });
  }

  void showEditDialog(BuildContext context) {
    final titleController = TextEditingController(text: todo.title);
    final descriptionController = TextEditingController(text: todo.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                // Update the todo instance
                todo.title = titleController.text;
                todo.description = descriptionController.text;

                editTodoInFirestore(todo);

                Navigator.of(context).pop();
                onDeletedTask();
              },
            ),
          ],
        );
      },
    );
  }
}
