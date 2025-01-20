import 'package:go_router/go_router.dart';
import 'package:notesapp/features/createNote/create_note_detail.dart';
import 'package:notesapp/features/notes/note_list.dart';
import 'package:notesapp/features/notes/note_list_view_model.dart';

final router = GoRouter(
  routes: routes,
  debugLogDiagnostics: true,
);

final routes = [
  GoRoute(
      path: '/notes',
      builder: (context, state) {
        final viewModel = NoteListViewModel(noteRepository: context.read());
        return NoteList(viewModel: viewModel);
      }),
  GoRoute(path: '/create-note', builder: (context, state) => CreateNoteDetail())
];
