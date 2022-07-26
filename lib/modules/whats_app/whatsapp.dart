import 'package:flutter/material.dart';

class whatsApp extends StatelessWidget {
  const whatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(18, 140, 126, 1),
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(18, 140, 126, 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'CHATS',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'STATUS',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'CALLS',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => chatBuild(),
                itemCount: 20,
                separatorBuilder: (BuildContext context, int index)=> const SizedBox(
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.message,
        ),
      ),
    );
  }

  Widget chatBuild() {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://thumbs.dreamstime.com/b/man-perfect-brilliant-smile-unshaven-face-defocused-background-guy-happy-emotional-expression-outdoors-bearded-man-124640934.jpg'),
              radius: 28,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ehab ahmed ali ehab ahmed ali ehab ahmed ali',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Hi How are you? my name is ehab ahmed ali and i am student at AIET',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: const [
                Text(
                  '9:49',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  radius: 12,
                ),
              ],
            ),

          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.emojiterra.com/google/android-11/512px/1f60a.png'
              ),
              radius: 28,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Weekend',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'typing...',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: const [
                Text(
                  '12:00',
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }
}
