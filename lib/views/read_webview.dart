import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadWebView extends StatefulWidget {
  const ReadWebView({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<ReadWebView> createState() => _ReadWebViewState();
}

class _ReadWebViewState extends State<ReadWebView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body:
            // Column(
            //   // shrinkWrap: true,
            //   // physics: const NeverScrollableScrollPhysics(),
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.all(15),
            //       width: double.infinity,
            //       height: 50,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           GestureDetector(
            //               onTap: () {
            //                 Navigator.pop(context);
            //               },
            //               child: Icon(
            //                 Icons.arrow_back_ios,
            //                 color: Colors.black,
            //               )),
            //         ],
            //       ),
            //     ),
            //     Expanded(
            //       child:
            WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
