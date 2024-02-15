import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add_todo_screen.dart';
import 'package:todo/constants.dart';
import 'package:todo/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TODO",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
        
      ),
      body: todoList.isEmpty ? const Center(
        child: Text('Well done! You have complete al the tasks'),

      )
      : ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(todoList[index].title!),
            leading: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorList[todoList[index].priority!],
                border: Border.all(
                  color:Colors.black,
                  width: 1
                )
              )
            ),
            // subtitle: Text(todoList[index].desc!),
            trailing:IconButton(icon: Icon(Icons.delete,
            color: Colors.red),
             onPressed: (){
              ref
              .read(todoProvider.notifier)
              .removeTodo(todoList[index]);
             } 
          ));

        }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> AddTodoScreen()));

        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


    );
  }
}