import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_vision/google_vision.dart';
import 'package:google_vision_flutter/google_vision_flutter.dart'
    hide GoogleVision, JsonImage;

/// A widget that builds a [GoogleVision] instance.
@Deprecated('Use GoogleVisionImageBuilder instead.')
class GoogleVisionBuilder extends GoogleVisionBuilderBase {
  /// The [ImageProvider] to be used for the image annotation.
  final ImageProvider imageProvider;

  /// The builder for the [GoogleVisionBuilder].
  final Widget Function(
    BuildContext context,
    AsyncSnapshot<AnnotatedResponses> snapshot,
    ImageDetail imageDetail,
  ) builder;

  /// Creates a new instance of [GoogleVisionBuilder].
  const GoogleVisionBuilder({
    super.key,
    required super.googleVision,
    required this.imageProvider,
    required super.features,
    required this.builder,
    super.onError,
    super.onLoading,
    int maxResults = 10,
  });

  /// Creates a new instance of [GoogleVisionBuilder] for crop hint detections.
  factory GoogleVisionBuilder.cropHints({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, CropHintsAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.cropHintsAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.cropHints, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for document text detections.
  factory GoogleVisionBuilder.documentTextDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, FullTextAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.fullTextAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.documentTextDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for face detections.
  factory GoogleVisionBuilder.faceDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<FaceAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.faceAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.faceDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for image properties detection.
  factory GoogleVisionBuilder.imageProperties({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, ImagePropertiesAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.imagePropertiesAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.imageProperties, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for label detections.
  factory GoogleVisionBuilder.labelDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.labelAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.labelDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for landmark detections.
  factory GoogleVisionBuilder.landmarkDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.landmarkAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.landmarkDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for logo detections.
  factory GoogleVisionBuilder.logoDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.logoAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.logoDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for object localization detections.
  factory GoogleVisionBuilder.objectLocalization({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(
            BuildContext, List<LocalizedObjectAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.localizedObjectAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.objectLocalization, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for product search detections.
  factory GoogleVisionBuilder.productSearch({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, ProductSearchResults?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.productSearchResults,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.productSearch, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for safe search detections.
  factory GoogleVisionBuilder.safeSearchDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, SafeSearchAnnotation?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.safeSearchAnnotation,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.safeSearchDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for text detections.
  factory GoogleVisionBuilder.textDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, List<EntityAnnotation>?, ImageDetail)
        builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.textAnnotations,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.textDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Creates a new instance of [GoogleVisionBuilder] for web detections.
  factory GoogleVisionBuilder.webDetection({
    Key? key,
    required Future<GoogleVision> googleVision,
    required ImageProvider imageProvider,
    required Widget Function(BuildContext, WebDetection?, ImageDetail) builder,
    Widget Function(Object)? onError,
    Widget Function()? onLoading,
    int maxResults = 10,
  }) =>
      GoogleVisionBuilder(
        builder: (BuildContext context,
                AsyncSnapshot<AnnotatedResponses> snapshot,
                ImageDetail imageDetail) =>
            GoogleVisionBuilderBase.checkSnapshot(
              snapshot,
              onError: onError,
              onLoading: onLoading,
            ) ??
            builder(
              context,
              snapshot.data?.responses.first.webDetection,
              imageDetail,
            ),
        imageProvider: imageProvider,
        googleVision: googleVision,
        features: GoogleVisionBuilderBase.getFeatures(
            AnnotationType.webDetection, maxResults),
        onError: onError,
        onLoading: onLoading,
      );

  /// Builds the widget.
  @override
  Widget build(BuildContext context) =>
      FutureBuilder<(GoogleVision, ImageDetail)>(
        future: waitConcurrently<GoogleVision, ImageDetail>(googleVision,
            imageProvider.getImageDetails(format: ImageByteFormat.png)),
        builder: (BuildContext context,
            AsyncSnapshot<(GoogleVision, ImageDetail)> snapshot) {
          GoogleVision? googleVision;

          ImageDetail? imageDetail;

          if (snapshot.hasError) {
            return onError != null
                ? onError!(snapshot.error!)
                : Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            googleVision = snapshot.data!.$1;

            imageDetail = snapshot.data!.$2;

            return FutureBuilder<AnnotatedResponses>(
              future: googleVision.annotate(
                  requests: AnnotationRequests(requests: [
                AnnotationRequest(
                    jsonImage: JsonImage(byteBuffer: imageDetail.byteBuffer),
                    features: features)
              ])),
              builder: (BuildContext context,
                      AsyncSnapshot<AnnotatedResponses> snapshot) =>
                  builder(
                context,
                snapshot,
                imageDetail!,
              ),
            );
          }

          return onLoading != null
              ? onLoading!()
              : const CircularProgressIndicator();
        },
      );
}
