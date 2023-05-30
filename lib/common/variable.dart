int currentIndex = 0;

const double bSize = 15;
const double mSize = 13;
const double sSize = 11;

/// Screen Size
var screenWidth = 100.0;
var screenHeight = 100.0;
var statusBarHeight = 24.0;
var appBarHeigight = 56.0;

/// Session
var session = {
  'EntCode' : '', 'EntName' : '',
  'DeptCode' : '', 'DeptName' : '',
  'EmpCode' : '', 'Name' : '',
  'RollPstn' : '', 'Position' : '',
  'Role' : '', 'Title' : '',
  'PayGrade' : '', 'Level' : '',
  'Email' : '', 'Photo' : '',
  'Auth' : "0", 'EntGroup' : '',
  'OfficeTel' : '', 'Mobile' : '',
  'DueDate' : '', 'Token' : '',
  'Route' : '', 'Languge' : ''
};

/// User Info Map - Login
class User {
  final String EntCode; final String EntName;
  final String DeptCode; final String DeptName;
  final String EmpCode; final String Name;
  final String RollPstn; final String Position;
  final String Role; final String Title;
  final String PayGrade; final String Level;
  final String Email; final String Photo;
  final int Auth; final String EntGroup;
  final String OfficeTel; final String Mobile;
  final String Token; final String Route;
  final String Language;

  User(this.EntCode, this.EntName, this.DeptCode, this.DeptName, this.EmpCode, this.Name, this.RollPstn, this.Position, this.Role, this.Title, this.PayGrade, this.Level, this.Email, this.Photo, this.Auth, this.EntGroup, this.OfficeTel, this.Mobile, this.Token, this.Route, this.Language);

  User.fromJson(Map<dynamic, dynamic> json)

      : EntCode = json['EntCode'], EntName = json['EntName'],
        DeptCode = json['DeptCode'], DeptName = json['DeptName'],
        EmpCode = json['EmpCode'], Name = json['Name'],
        RollPstn = json['RollPstn'], Position = json['Position'],
        Role = json['Role'], Title = json['Title'],
        PayGrade = json['PayGrade'], Level = json['Level'],
        Email = json['Email'], Photo = json['Photo'],
        Auth = json['Auth'], EntGroup = json['EntGroup'],
        OfficeTel = json['OfficeTel'], Mobile = json['Mobile'],
        Token = json['Token'], Route = json['Route'],
        Language = json['Language'];

  Map<dynamic, dynamic> toJson() =>
      {
        'EntCode' : EntCode, 'EntName' : EntName,
        'DeptCode' : DeptCode, 'DeptName' : DeptName,
        'EmpCode' : EmpCode, 'Name' : Name,
        'RollPstn' : RollPstn, 'Position' : Position,
        'Role' : Role, 'Title' : Title,
        'PayGrade' : PayGrade, 'Level' : Level,
        'Email' : Email, 'Photo' : Photo,
        'Auth' : Auth, 'EntGroup' : EntGroup,
        'OfficeTel' : OfficeTel, 'Mobile' : Mobile,
        'Token' : Token, 'Route' : Route,
        'Language' : Language,
      };
}

/// 비밀번호 초기화용 변수
var resetpass = { "company" : "", "empcode" : "", "name" : "", "question1" : "", "question2" : "" };
var messagenum = "";