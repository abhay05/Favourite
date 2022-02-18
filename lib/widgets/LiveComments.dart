import 'package:flutter/material.dart';

class LiveComments extends StatefulWidget {
  double height;
  double width;
  LiveComments(this.height, this.width);
  @override
  _LiveCommentsState createState() => _LiveCommentsState();
}

class _LiveCommentsState extends State<LiveComments> {
  var comments = [];
  var like = 0;
  var dislike = 0;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
              height: widget.height * 0.7,
              width: widget.width,
              padding: EdgeInsets.only(top: 30),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int ind) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: widget.width * 0.05,
                        ),
                        Card(
                            elevation: 0,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      width: widget.width * 0.9,
                                      child: Text(comments[ind])),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                like += 1;
                                              });
                                            },
                                            child: Text("Like")),
                                        Text(like.toString()),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                dislike += 1;
                                              });
                                            },
                                            child: Text("Dislike")),
                                        Text(dislike.toString())
                                      ])
                                ])),
                      ]);
                },
                itemCount: comments.length,
                separatorBuilder: (BuildContext context, int ind) {
                  return SizedBox(height: 0);
                },
              )),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.width * 0.05,
              ),
              Container(
                //height: widget.height * 0.08,
                // color: Colors.cyan,
                width: widget.width * 0.75,
                // decoration: BoxDecoration(color: Colors.grey),
                //padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                child: Container(
                  height: 60, //widget.height * 0.07,
                  //padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   width: 1,
                      // ),
                      ),
                  child: TextField(
                    minLines: 1,
                    maxLines: 4,
                    controller: _controller,
                    //cursorHeight:10,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                      hintText: "Enter Comment",
                      fillColor: Color(0xffF5F5F5),
                      filled: true,
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ), //InputBorder.none,
                    ),
                  ),
                ),
              ),
              TextButton(
                //style:ButtonStyle(),
                onPressed: () {
                  setState(() {
                    comments.add(_controller.text);
                  });
                  _controller.text = '';
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  // color: Colors.brown,
                  child: Text("Post"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
