# flutter_module

A new Flutter module project.

## Getting Started


```shell
flutter pub get
```


```shell
flutter pub run pigeon --input lib/pigeon/hybrid_message_data_api_schema.dart --dart_out lib/hybrid_message_data_api.dart --kotlin_out ../hybridandroid/app/src/main/java/com/example/hybrid_android/hybrid_message_data_api.kt
```

Pigeon is a tool for generating type-safe communication code between Flutter
and the host platform.

usage: pigeon --input <pigeon path> --dart_out <dart path> [option]*

options:
--input                                 REQUIRED: Path to pigeon file.
--dart_out                              Path to generated Dart source file (.dart). Required if one_language is not specified.
--dart_test_out                         Path to generated library for Dart tests, when using @HostApi(dartHostTestHandler:).
--objc_source_out                       Path to generated Objective-C source file (.m).
--java_out                              Path to generated Java file (.java).
--java_package                          The package that generated Java code will be in.
--[no-]java_use_generated_annotation    Adds the java.annotation.Generated annotation to the output.
--swift_out                             Path to generated Swift file (.swift).
--kotlin_out                            Path to generated Kotlin file (.kt).
--kotlin_package                        The package that generated Kotlin code will be in.
--cpp_header_out                        Path to generated C++ header file (.h).
--cpp_source_out                        Path to generated C++ classes file (.cpp).
--cpp_namespace                         The namespace that generated C++ code will be in.
--objc_header_out                       Path to generated Objective-C header file (.h).
--objc_prefix                           Prefix for generated Objective-C classes and protocols.
--copyright_header                      Path to file with copyright header to be prepended to generated code.
--[no-]one_language                     Allow Pigeon to only generate code for one language.
--ast_out                               Path to generated AST debugging info. (Warning: format subject to change)
--[no-]debug_generators                 Print the line number of the generator in comments at newlines.
--package_name                          The package that generated code will be in.

#Yooosssshhhh
