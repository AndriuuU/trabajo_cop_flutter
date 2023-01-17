import 'dart:convert';

class Pedidos {
  Pedidos({
    required this.id,
    required this.numero,
    required this.target_company_id,
    required this.created_at,
    required this.issuedate,
    //icono del albaran??
    //icono de la factura??
  });

  int id;
  String numero;
  String target_company_id;
  String created_at;
  String issuedate;

  factory Pedidos.fromJson(String str) => Pedidos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pedidos.fromMap(Map<String, dynamic> json) => Pedidos(
        id: json["id"],
        numero: json["numero"],
        target_company_id: json["target_company_id"],
        created_at: json["created_at"],
        issuedate: json["issuedate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "numero": numero,
        "target_company_id": target_company_id,
        "created_at": created_at,
        "issuedate": issuedate,
      };
}
