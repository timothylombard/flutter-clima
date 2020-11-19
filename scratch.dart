import 'dart:io';

void main() {
  performTasks();
}

// This is an asynchronous function made from the "async" option paired whit "await"
void performTasks() async {
  task1();
  print(task2());
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}
//a "Future" like a receipt for a item that's on its way. (Coffee, Movie)
Future<String> task2()  async {
  Duration threeSeconds = Duration(seconds: 3);

  String result;

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete ($result) with $task2Data');
}