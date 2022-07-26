import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messengerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.blue,
          ),
        ),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.skynewsarabia.com/images/v1/2020/01/21/1314489/800/450/1-1314489.jpg'),
              radius: 25,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.blue[300],
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.blue[300],
              child: const Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => storyBuild(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 5,
                  ),
                  itemCount: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => chatBuild(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*===================================== Functions =========================================*/

  Widget chatBuild() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.skynewsarabia.com/images/v1/2020/01/21/1314489/800/450/1-1314489.jpg'),
              radius: 30,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 5.5,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 5,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ehab Ahmed Ali Ehab Ahmed Ali',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Hello My name is Ehab Hello my name is ehab and i live in alexandria Hello my name is ehab and i live in alexandriaHello my name is ehab and i live in alexandria',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 3,
                    ),
                  ),
                  Text('88:88'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget storyBuild() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.skynewsarabia.com/images/v1/2020/01/21/1314489/800/450/1-1314489.jpg'),
                  radius: 30,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 5.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 5,
                  ),
                ),
              ],
            ),
            const Text(
              'Ehab Ahmed Ali Ehab Ahmed Ali',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}





// الحزء الخاص بال search
// TextFormField(
//   decoration: const InputDecoration(
//     hintText: 'Search',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//           Radius.circular(15)),
//     ),
//     prefixIcon: Icon(
//       Icons.search,
//     ),
//   ),
// ),
