import 'package:go_router/go_router.dart';
import 'package:notesapp/app/navigation/root_screen.dart';
import 'package:notesapp/features/createNote/create_note_detail.dart';
import 'package:notesapp/features/createNote/create_note_view_model.dart';
import 'package:notesapp/features/notes/note_list.dart';
import 'package:notesapp/features/notes/note_list_view_model.dart';
import 'package:notesapp/features/tasks/task_list.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: '/notes',
  routes: routes,
  debugLogDiagnostics: true,
);

final routes = [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notes',
              builder: (context, state) => NoteList(
                viewModel: context.watch<NoteListViewModel>(),
              ),
            ),
            GoRoute(
              path: '/create-note',
              builder: (context, state) => CreateNoteDetail(
                viewModel: context.watch<CreateNoteViewModel>(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/tasks', builder: (context, state) => const TaskList()),
          ],
        ),
      ])
];
