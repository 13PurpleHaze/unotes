import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/navigation/root-screen.dart';
import 'package:notesapp/features/categories/category_list.dart';
import 'package:notesapp/features/categories/category_list_view_model.dart';
import 'package:notesapp/features/create_note/create_note.dart';
import 'package:notesapp/features/settings/settings_list.dart';
import 'package:provider/provider.dart';

import 'package:notesapp/features/notes/notes.dart';

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
            routes: [
              GoRoute(
                path: 'create',
                builder: (context, state) {
                  final Function afterCreated = state.extra as Function;
                  return CreateNoteDetail(
                    viewModel: context.watch<CreateNoteViewModel>(),
                    afterCreated: afterCreated,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/categories',
            builder: (context, state) => CategoryList(
              viewModel: context.watch<CategoryListViewModel>(),
            ),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => SettingsList(),
          ),
        ],
      ),
    ],
  ),

  // GoRoute(
  //     path: '/notes',
  //     builder: (context, state) => NoteList(
  //           viewModel: context.watch<NoteListViewModel>(),
  //         ),
  //     routes: [
  //       // GoRoute(
  //       //   path: ':noteId',
  //       //   builder: (context, state) =>
  //       // ),
  //       GoRoute(
  //           path: 'create',
  //           builder: (context, state) => CreateNoteDetail(
  //               viewModel: context.watch<CreateNoteViewModel>())),
  //       // GoRoute(
  //       //   path: ':noteId/update',
  //       //   builder: (context, state) =>
  //       // ),
  //       // GoRoute(
  //       //   path: ':noteId/delete',
  //       //   builder: (context, state) =>
  //       // )
  //     ]),
  // GoRoute(
  //   path: '/categories',
  //   builder: (context, state) => CategoryList(
  //     viewModel: context.watch<CategoryListViewModel>(),
  //   ),
  // ),
  // GoRoute(
  //   path: '/settings',
  //   builder: (context, state) => SettingsList(),
  // ),
];
