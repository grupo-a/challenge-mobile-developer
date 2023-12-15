abstract class ModelBase {
  int? id;
  int? usuarioId;

  ModelBase({this.id, this.usuarioId});
  ModelBase.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
