// ignore_for_file: non_constant_identifier_names

class AppLink {
  static String server = "http://127.0.0.1:8000";

  // ******** SignUser
  static String signup = "$server/api/user/create";
  static String login = "$server/api/user/login";
  static String logout = "$server/api/user/logout";
  static String usersdata = "$server/api/user/viewAllUsers";

  // ******** Groups
  static String CreateGroup = "$server/api/group/create";
  static String ViewMyGroups = "$server/api/group/mygroups";
  static String ViewAllGroups = "$server/api/group/getallgroups";
  static String DeleteGroup = "$server/api/group/delete";
  static String LeaveGroup = "$server/api/group/leave";
  static String AddUserToGroup = "$server/api/group/belong";
  static String RemoveUserfromGroup = "$server/api/group/remove";
  static String UpdateGroup = "$server/api/group/update";

// ********* Files
  static String CreateFile = "$server/api/file/create";
  static String ViewMyFilesByGroupId = "$server/api/file/getbygroup";
  static String DeleteFile = "$server/api/file/deletefile";
  static String CheckIn = "$server/api/file/check";
  static String CheckOut = "$server/api/file/checkout";
  static String EditFile = "$server/api/file/editfile";
  static String ReplaceFile = "$server/api/file/replace";
  
}
