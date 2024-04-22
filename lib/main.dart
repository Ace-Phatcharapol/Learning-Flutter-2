//Login
void main() async{
  print(await loginUser());
  print("ทำงานอื่นต่อไป");
}

//ดึงข้อมูล
Future <String> loginUser() async{
  var user = await getUserFromDatabase();
  return "ขื่อผู้ใช้ที่ค้นหา คือ " + user;
}

//ได้ข้อมูลในอนาคตต้องรอตามวินาทีที่กำหนดไว้
Future <String> getUserFromDatabase() {
  return Future.delayed(Duration(seconds: 10),()=>"Ace");
}
