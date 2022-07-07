class DailyUpdateModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? projectId;
  String? acknowledgedAt;

  DailyUpdateModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.acknowledgedAt,
    this.projectId,
  });

  DailyUpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    acknowledgedAt = json['acknowledge_at'];
  }
}
