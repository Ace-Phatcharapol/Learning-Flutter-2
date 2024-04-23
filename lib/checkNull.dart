void main() async {
  Employee emp = Employee();
  // if(emp != null){
  //   emp.showData();
  // }
  //หรือเขียนอีกแบบ คือ
  emp?.showData();
}

class Employee {
  void showData() {
    print("แสดงข้อมูล");
  }
}
