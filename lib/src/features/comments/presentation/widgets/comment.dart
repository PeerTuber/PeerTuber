import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, this.isSoloComment = false});

  final bool isSoloComment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)),
                child: const SizedBox(
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username'),
                    Text(
                      'This is a comment from me, it is a long one. This is a comment from me, it is a long one. This is a comment from me, it is a long one. This is a comment from me, it is a long one. ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: !isSoloComment,
          child: const Column(
            children: [
              Text('show more'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
