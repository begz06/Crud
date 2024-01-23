

class Board {
  final int? id;
  final String? title;
  final Creator? creator;
  final List<dynamic>? taskConditions;
  final String? createdAt;
  final String? updateAt;

  Board({
    this.id,
    this.title,
    this.creator,
    this.taskConditions,
    this.createdAt,
    this.updateAt,
  });

  factory Board.fromJson(Map<String, dynamic> json) => Board(
    id: json["id"],
    title: json["title"],
    creator: json["creator"] == null ? null : Creator.fromJson(json["creator"]),
    taskConditions: json["task_conditions"] == null ? [] : List<dynamic>.from(json["task_conditions"]!.map((x) => x)),
    createdAt: json["created_at"],
    updateAt: json["update_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "creator": creator?.toJson(),
    "task_conditions": taskConditions == null ? [] : List<dynamic>.from(taskConditions!.map((x) => x)),
    "created_at": createdAt,
    "update_at": updateAt,
  };
}

class Creator {
  final int? id;
  final dynamic firstName;
  final dynamic lastName;
  final String? phone;

  Creator({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
  };
}
