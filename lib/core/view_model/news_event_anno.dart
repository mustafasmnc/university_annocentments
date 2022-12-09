import 'package:flutter/material.dart';
import 'package:webscraping/core/view_model/widgets/widgets.dart';

import '../theme/app_colors.dart';

class NewsEventAnno extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? imgLink;
  final String? day;
  final String? month;
  final String? link;
  const NewsEventAnno(
      {Key? key,
      this.title,
      this.desc,
      this.imgLink,
      this.day,
      this.month,
      this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: customTileColor(context),
            height: 130,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FadeInImage(
                          width: MediaQuery.of(context).size.width,
                          image: NetworkImage(imgLink!),
                          placeholder:
                              const AssetImage("assets/img/uni_logo_white.png"),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: customTileColor(context).withOpacity(0.8),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.error_outline),
                                  Text(
                                    'Görsel Yüklenemedi!',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 130,
                    width: 110,
                    //color: Colors.red,
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 45,
                      color:const  Color(0xFF292D32).withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '$month',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Container(
                              height: .5,
                              color: Colors.white,
                              width: 20,
                            ),
                            Text(
                              '$day',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: double.infinity,
                          padding:const  EdgeInsets.all(5),
                          color: Colors.black26.withOpacity(.2),
                          child: Text(
                            title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:const  TextStyle(fontSize: 16),
                          ),
                        ),
                        //Divider(),
                        Container(
                          height: 85,
                          width: double.infinity,
                          padding:const  EdgeInsets.all(5),
                          child: Text(
                            desc!,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style:const  TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => launchURL(link!));
  }
}
