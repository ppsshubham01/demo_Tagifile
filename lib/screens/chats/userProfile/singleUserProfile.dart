import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagifiles/model/chatUsersModel.dart';

class SingleUserProfile extends StatefulWidget {
  String userNetworkImage;
  // String userName;
  // ChatUsers userItem;
  Map<String, dynamic> userItem;
  SingleUserProfile({super.key, required this.userItem,required this.userNetworkImage});

  @override
  State<SingleUserProfile> createState() => _SingleUserProfileState();
}

class _SingleUserProfileState extends State<SingleUserProfile> with SingleTickerProviderStateMixin {

  String  title= "selectedmore";
  String item1 = "1st Item";
  String item2 = "2st Item";
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF1D55A4),
            title: Row(
              children: [
                GestureDetector(
                  onTap: (){ Navigator.pop(context);},
                  child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                ),
                const SizedBox(width: 15,),
                Text(widget.userItem['first_name'],style: const TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,fontSize: 18.5),),
              ],
            ),
            actions: [
              popupmenubtn(context),
            ],
          ),

        body: Container(
          color: const Color(0xFFEDEFF3),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 300,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 10,),
                    Stack(
                      children: [

                    CircleAvatar(radius: 75,backgroundImage: NetworkImage(widget.userNetworkImage),),
                      const Positioned(
                          bottom: 20,
                          right: 2,
                          child: Icon(Icons.edit))
                      ],
                    ),
                    Text(widget.userItem['first_name'],style: const TextStyle(color: Color(0xFF566476),fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    const Text("number/subName",style: TextStyle(color: Color(0xFFA8A7A7),fontSize: 14),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.call,size: 32,color: Color(0xFF707070),)),
                        const SizedBox(width: 20,),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.videocam_outlined,size: 32,color: Color(0xFF707070),)),
                      ],
                    )

                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                color: Colors.white,
                height: 80,
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 18.0,left: 20,bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About",style: TextStyle(color: Color(0xFFA8A7A7),fontSize: 14),),
                          SizedBox(height: 7,),
                          Text("Hey! there I am using Tagifiles",style: TextStyle(color: Color(0xFF414141),fontSize: 16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                color: const Color(0xFF1D55A4),
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xFF87A7D4),
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "Media",),
                    Tab(text: "Files",),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 150,
                  width: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Center(child: media()),
                      const Center(child: Text("Files Tab"),),
                    ],
                  ),
                ),
              ),


              // const SizedBox(height: 5,),
              // Flexible(
              //   child: Container(
              //     color: Colors.white,
              //     height: 600,
              //     width: double.infinity,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 18.0,left: 20,bottom: 5),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: <Widget> [
              //           const Row(children: [Icon(CupertinoIcons.star,color: Color(0xFF566476),),SizedBox(width: 10,),Text("Starred Message",style: TextStyle(color: Color(0xFF566476)),)],),
              //           const SizedBox(height: 10,),
              //           const Row(children: [Icon(CupertinoIcons.delete,color: Color(0xFFEE3E3E),),SizedBox(width: 10,),Text("Delete Chat",style: TextStyle(color: Color(0xFF566476)),)],),
              //           const SizedBox(height: 10,),
              //           Row(children: [const Icon(CupertinoIcons.nosign,color: Color(0xFFEE3E3E),),const SizedBox(width: 10,),Text("Block ${widget.userItem.name}",style: const TextStyle(color: Color(0xFF566476)),)],),
              //           const SizedBox(height: 10,),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget media() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemCount: 8,
          itemBuilder: (context,index){

            return  Container(
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    // border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(widget.userNetworkImage,),
                  ),);
          }),
  );

  Widget files() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.builder(
      itemCount: 3,
        itemBuilder: (context, index){
        return ListTile(
          // leading:
          // ,
          //
          // ,
          // title: ,
          // trailing: ,
        );

        })
  );

  popupmenubtn(BuildContext context)=> PopupMenuButton(
    color: Colors.white,
    iconColor: Colors.white,
    itemBuilder: (context) => [
      PopupMenuItem(value: item1,child: Text(item1),),
      PopupMenuItem(value: item2,child: Text(item2),),
    ],
    onSelected:(String newValue){
      print(newValue);
    } ,
  );

}

