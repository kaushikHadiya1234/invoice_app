
class DataModal
{
  String? bname,badd,bphno,mailid;

  DataModal({this.bname, this.badd, this.bphno, this.mailid});
}

class UserDataModal
{
  String? name,add,no,mail;

  UserDataModal({this.name, this.add, this.no, this.mail});
}

class ItemModal
{
  String? ino,iname,iqnty,iprice;
  int? itotal;

  ItemModal({this.ino, this.iname, this.iqnty, this.iprice,this.itotal});
}