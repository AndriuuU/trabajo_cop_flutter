import 'dart:convert';

class ListaPedidosComposer {
    ListaPedidosComposer({
        this.message,
        this.exception,
        this.file,
        this.line,
        this.trace,
    });

    String? message;
    String? exception;
    String? file;
    int? line;
    List<Trace?>? trace;

    factory ListaPedidosComposer.fromJson(String str) => ListaPedidosComposer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ListaPedidosComposer.fromMap(Map<String, dynamic> json) => ListaPedidosComposer(
        message: json["message"],
        exception: json["exception"],
        file: json["file"],
        line: json["line"],
        trace: json["trace"] == null ? [] : List<Trace?>.from(json["trace"]!.map((x) => Trace.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "exception": exception,
        "file": file,
        "line": line,
        "trace": trace == null ? [] : List<dynamic>.from(trace!.map((x) => x!.toMap())),
    };
}

// class Trace {
//     Trace({
//        required this.file,
//        required this.line,
//        required this.function,
//        required this.traceClass,
//        required this.type,
//     });

//     String? file;
//     int? line;
//     String? function;
//     String? traceClass;
//     Type? type;

//     factory Trace.fromJson(String str) => Trace.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Trace.fromMap(Map<String, dynamic> json) => Trace(
//         file: json["file"],
//         line: json["line"],
//         function: json["function"],
//         traceClass: json["class"],
//         type: typeValues!.map[json["type"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "file": file,
//         "line": line,
//         "function": function,
//         "class": traceClass,
//         "type": typeValues.reverse![type],
//     };
// }

enum Type { EMPTY }

final typeValues = EnumValues({
    "->": Type.EMPTY
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}



class Trace {
  Trace({
     required this.file,
     required this.line,
     required this.function,
     required this.traceClass,
     required this.type,
    //icono del albaran y de la factura en en la screen
  });

  String? file;
  int? line;
  String? function;
  String? traceClass;
  Type? type;

  factory Trace.fromJson(String str) => Trace.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Trace.fromMap(Map<String, dynamic> json) => Trace(
        file: json["file"],
        line: json["line"],
        function: json["function"],
        traceClass: json["class"],
        type: typeValues!.map[json["type"]],
      );

 Map<String, dynamic> toMap() => {
        "file": file,
        "line": line,
        "function": function,
        "class": traceClass,
        "type": typeValues.reverse![type],
    };
}
