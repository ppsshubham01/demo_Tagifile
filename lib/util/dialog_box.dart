import 'package:flutter/material.dart';

class PopDialog {
  void showPopupMenu(BuildContext context) {
    showMenu(
      color: Colors.white,
      // context: event.target as Element, // Get context from the event target
      context: context, // Get context from the event target
      position: const RelativeRect.fromLTRB(10, 245, 0, 0),
      items: const [
        PopupMenuItem(
          value: 'Preview',
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Color(0xFF566476)),
              SizedBox(
                width: 10,
              ),
              Text(
                'View Details',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Share',
          child: Row(
            children: [
              Icon(Icons.arrow_forward, color: Color(0xFF566476)),
              SizedBox(
                width: 10,
              ),
              Text(
                'Forward',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Get Link',
          child: Row(
            children: [
              Icon(Icons.reply, color: Color(0xFF566476)),
              SizedBox(
                width: 10,
              ),
              Text(
                'Reply',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Remove',
          child: Row(
            children: [
              Icon(Icons.copy, color: Color(0xFF566476)),
              SizedBox(
                width: 10,
              ),
              Text(
                'Copy',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Remove',
          child: Row(
            children: [
              Icon(Icons.edit, color: Color(0xFF566476)),
              SizedBox(
                width: 10,
              ),
              Text(
                'Edit Message',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Remove',
          child: Row(
            children: [
              Icon(
                Icons.star_border,
                color: Color(0xFF566476),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Starred Message',
                style: TextStyle(color: Color(0xFF7A7A7A)),
              ),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        // onMenuItemSelected(value); // Call the callback with the selected value
      }
    });
  }

  void showsendPopmenu(BuildContext context) {
    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(10, 245, 0, 5),
        items: const [
          PopupMenuItem(
              child: Row(
            children: [
              Icon(Icons.photo_album_outlined),
              Text('Photo'),
            ],
          )),
          PopupMenuItem(child: Text('Document')),
          PopupMenuItem(child: Text('Camera')),
          PopupMenuItem(child: Text('Video')),
          PopupMenuItem(child: Text('Attachment')),
        ]);
  }
}
