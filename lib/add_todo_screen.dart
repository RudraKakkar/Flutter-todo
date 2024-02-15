import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_provider.dart';

class AddTodoScreen extends ConsumerWidget {
   AddTodoScreen({super.key});

  final todoController = TextEditingController();
  int priority = 0;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body:  Column(
        children: [

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller:todoController,
              decoration: InputDecoration(
                
                hintText:"Task"
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: TextField(
          //     controller:todoController,
          //     decoration: InputDecoration(
          //       hintText:"Discription"
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 70,
            
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colorList.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      priority = index;
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorList[index],
                        border:Border.all(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(onPressed:() {
            final todo = Todo(
              title:todoController.text,
              desc:todoController.text,
              isDone: false,
              priority: priority,
              id:DateTime.now().millisecondsSinceEpoch.toString()

            );
            ref.read(todoProvider.notifier).add(todo);
            todoController.clear();
            Navigator.pop(context);
            
          }, child: const Text("Add todo"))
        ],
        
       ),
    );
  }
}