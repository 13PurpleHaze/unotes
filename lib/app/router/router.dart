import 'package:go_router/go_router.dart';
import 'package:notesapp/features/createNote/create_note_detail.dart';
import 'package:notesapp/features/createNote/create_note_view_model.dart';
import 'package:notesapp/features/notes/note_list.dart';
import 'package:notesapp/features/notes/note_list_view_model.dart';
import 'package:notesapp/features/notes/note_repository.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: '/notes',
  routes: routes,
  debugLogDiagnostics: true,
);

final routes = [
  GoRoute(
      path: '/notes',
      builder: (context, state) {
        return NoteList(viewModel: context.watch());
      }),
  GoRoute(
      path: '/create-note',
      builder: (context, state) => CreateNoteDetail(viewModel: context.watch()))
];
