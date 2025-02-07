import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/features/notes/notes.dart';

final GoRouter router = GoRouter(
  initialLocation: '/notes',
  routes: routes,
  debugLogDiagnostics: true,
);

final routes = [
  GoRoute(
      path: '/notes',
      builder: (context, state) => NoteList(
            viewModel: context.watch<NoteListViewModel>(),
          ),
      routes: [
        // GoRoute(
        //   path: ':noteId',
        //   builder: (context, state) =>
        // ),
        // GoRoute(
        //   path: 'create',
        //   builder: (context, state) =>
        // ),
        // GoRoute(
        //   path: ':noteId/update',
        //   builder: (context, state) =>
        // ),
        // GoRoute(
        //   path: ':noteId/delete',
        //   builder: (context, state) =>
        // )
      ]),
];
