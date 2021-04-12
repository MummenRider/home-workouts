import 'dart:ui';
import 'package:app/screens/activity/activity_viewmodel.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ActivityViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          elevation: 0,
          leading: GestureDetector(
            onTap: () => model.goBack(),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: model.account == null
            ? SpinKitThreeBounce(
                color: Colors.teal,
              )
            : Stack(
                children: [
                  Center(
                    child: ExtendedImage.network(
                      model.account.displayProfileURL,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      loadStateChanged: (ExtendedImageState state) {
                        if (state.extendedImageLoadState == LoadState.failed) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          );
                        } else if (state.extendedImageLoadState ==
                            LoadState.loading) {
                          return Image.asset(
                            'assets/loading.gif',
                            scale: .5,
                            fit: BoxFit.contain,
                          );
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 25,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                        child: Container(
                          height: size.height * 0.50,
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ExtendedImage.network(
                                      model.account.displayProfileURL,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      shape: BoxShape.circle,
                                      loadStateChanged:
                                          (ExtendedImageState state) {
                                        if (state.extendedImageLoadState ==
                                            LoadState.failed) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            width: 100,
                                            height: 100,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.grey[800],
                                            ),
                                          );
                                        } else if (state
                                                .extendedImageLoadState ==
                                            LoadState.loading) {
                                          return Image.asset(
                                            'assets/loading.gif',
                                            scale: .5,
                                            fit: BoxFit.contain,
                                          );
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'About ${model.account.firstName}',
                                            style: TextStyle(
                                              fontSize: 18.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            model.account.aboutMe,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      'Today\'s Goal',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 120.0,
                                          lineWidth: 8.0,
                                          animation: true,
                                          animationDuration: 1500,
                                          percent: 0.7,
                                          animateFromLastPercent: true,
                                          center: Text(
                                            "70.0%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.teal,
                                          widgetIndicator: RotatedBox(
                                            quarterTurns: 1,
                                            child: Icon(
                                              Icons.navigation_sharp,
                                              size: 30,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: LinearPercentIndicator(
                                                  width: 120.0,
                                                  animation: true,
                                                  leading: Text(
                                                    'Protein',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  lineHeight: 10.0,
                                                  percent: 0.2,
                                                  progressColor: Colors.red,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: LinearPercentIndicator(
                                                  width: 120.0,
                                                  animation: true,
                                                  leading: Text(
                                                    'Carbs  ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  lineHeight: 10.0,
                                                  percent: 0.5,
                                                  progressColor: Colors.orange,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: LinearPercentIndicator(
                                                  animation: true,
                                                  width: 120.0,
                                                  leading: Text(
                                                    'Fat       ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  lineHeight: 10.0,
                                                  percent: 0.9,
                                                  progressColor: Colors.blue,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
      viewModelBuilder: () => ActivityViewModel(),
      onModelReady: (model) => model.userProfileStream(),
    );
  }
}
