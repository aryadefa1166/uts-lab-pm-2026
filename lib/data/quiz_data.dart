import '../models/question_model.dart';

final List<Question> dummyQuestions = [
  Question(
    questionText: "Apa kepanjangan dari IKLC?",
    options: ["Ilmu Komputer Laboratory Center", "Ilmu Komputer Learning Center", "Informatika Komputer Lab Center", "Ilmu Komputer Logical Center"],
    correctOptionIndex: 0,
  ),
  Question(
    questionText: "Widget apa yang ukurannya dapat menyesuaikan dengan ruang yang tersedia secara dinamis di Flutter?",
    options: ["Container", "Expanded", "SizedBox", "Padding"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Manakah dari berikut ini yang BUKAN merupakan tipe data bawaan di Dart?",
    options: ["int", "String", "boolean", "double"],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Fungsi apa yang pertama kali dipanggil saat aplikasi Flutter dijalankan?",
    options: ["runApp()", "main()", "build()", "initState()"],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "State management apa yang secara bawaan disediakan oleh Flutter untuk memperbarui UI pada Stateful Widget?",
    options: ["Provider", "Bloc", "setState", "GetX"],
    correctOptionIndex: 2,
  ),
];