import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/web_views.dart';
import 'package:webscraping/size_config.dart';

class NewsEventAnno extends StatelessWidget {
  final title;
  final desc;
  final imgLink;
  final day;
  final month;
  final link;
  NewsEventAnno(
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ThemeService.instance.isDarkMode()
                    ? "assets/img/footer-bg.png"
                    : "assets/img/bg-pattern.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 130,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imgLink),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 130,
                    width: 110,
                    //color: Colors.red,
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 45,
                      color: Color(0xFF292D32).withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '$month',
                              style: TextStyle(color: Colors.white,fontSize: SizeConfig.screenHeight! > 600 ? 14 : 11),
                            ),
                            Container(
                              height: .5,
                              color: Colors.white,
                              width: 20,
                            ),
                            Text(
                              '$day',
                              style: TextStyle(color: Colors.white,fontSize: SizeConfig.screenHeight! > 600 ? 14 : 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          color: Colors.black26.withOpacity(.2),
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                    SizeConfig.screenHeight! > 600 ? 16 : 13),
                          ),
                        ),
                        //Divider(),
                        Container(
                          height: 85,
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            desc,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                    SizeConfig.screenHeight! > 600 ? 14 : 11),
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
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyWebViews(myUrl: link))));
  }
}
