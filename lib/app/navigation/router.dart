import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/app/navigation/navigation.dart';
import 'package:notesapp/features/notes/notes.dart';
import 'package:notesapp/features/create_note/create_note.dart';
import 'package:notesapp/features/tasks/tasks.dart';

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
