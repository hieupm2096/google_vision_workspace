import 'dart:convert';
import 'dart:typed_data';

import 'package:universal_io/io.dart';

class JsonImage {
  final String? imageUri;

  final ByteBuffer? byteBuffer;

  JsonImage({
    this.imageUri,
    this.byteBuffer,
  }) {
    if (imageUri == null && byteBuffer == null) {
      throw Exception('Invalid JsonImage');
    }
  }

  factory JsonImage.fromBuffer(ByteBuffer buffer) =>
      JsonImage(byteBuffer: buffer);

  factory JsonImage.fromGsUri(String gsUri) => JsonImage(imageUri: gsUri);

  factory JsonImage.fromFile(File file) =>
      JsonImage(byteBuffer: file.readAsBytesSync().buffer);

  factory JsonImage.fromfilePath(String fileNameandPath) =>
      JsonImage(byteBuffer: File(fileNameandPath).readAsBytesSync().buffer);

  factory JsonImage.fromJson(Map<String, dynamic> json) => JsonImage(
        byteBuffer: json.containsKey('content')
            ? base64.decode(json['content']).buffer
            : null,
        imageUri:
            json.containsKey('source') && json['source'].containsKey('imageUri')
                ? json['source']['imageUri']
                : null,
      );

  Map<String, dynamic> toJson() => byteBuffer != null
      ? {'content': base64Encode(byteBuffer!.asUint8List())}
      : {
          'source': {'imageUri': imageUri}
        };

  @override
  String toString() => json.encode(toJson());
}
