import 'package:flutter/material.dart';

Widget get loadingView => Center(
      child: CircleAvatar(
        backgroundColor: Colors.purple[200],
        child: const CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
    );
