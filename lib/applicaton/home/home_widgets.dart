import 'package:comment_adder/applicaton/home/constants.dart';
import 'package:flutter/material.dart';

class TopBoxWidget extends StatelessWidget {
  const TopBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kTopBoxDecration,
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kSpaceBox,
          const TitleWidget(),
          Expanded(
              flex: 5,
              child: Image.network(
                  'https://img.freepik.com/premium-vector/credit-cards-vector-debit-credit-card-icon-front-back-views-contactless-payment-system-technology-credit-card-vector-mockups-paying-purchasing_435184-640.jpg'))
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: kTitleBoxDecration,
        width: double.infinity,
        child: const Center(
          child: Text(
            'Add Cmments',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({
    super.key,
    required this.icon,
    this.child,
    required this.comment,
  });

  final IconData icon;
  final Widget? child;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kCommentBoxPadding,
      child: Container(
          height: 70,
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(22),
              color: kBottomBoxColur),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                child: child,
                backgroundColor: Colors.lightGreen,
              ),
              title: Text(
                comment,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(
                icon,
                size: 30,
              ),
            ),
          )),
    );
  }
}

class SeasrchBox extends StatelessWidget {
  const SeasrchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'search',
          filled: true,
          fillColor: Color(0xffEDEDED),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kBottomBoxColur), // Set your desired outline color here
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(30))
        ),
      ),
    );
  }
}
