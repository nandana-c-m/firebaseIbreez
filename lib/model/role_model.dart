class RoleModel{
  final String? uid;
  final String? roleId;
  final String? role;

  RoleModel({
    this.uid,
    this.roleId,
    this.role
});

  toJson(){
    return {
      "uid":uid,
      "role":role,

    };
  }
}