import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snokie_shoe/core/extension.dart';
import 'package:snokie_shoe/domain/vos/shoe_vo.dart';
import 'package:snokie_shoe/presentation/reusable_widget/custom_network_image.dart';
import 'package:snokie_shoe/presentation/reusable_widget/fix_widget.dart';
import 'package:snokie_shoe/presentation/screens/detail_screen/widget/counter_widget.dart';
import 'package:snokie_shoe/presentation/screens/detail_screen/widget/shoe_size_widget.dart';
import 'package:snokie_shoe/utils/color_constants.dart';
import 'package:snokie_shoe/utils/font_and_margin.dart';
import 'package:snokie_shoe/viewmodel/detail_view_model.dart';

class DetailScreen extends StatelessWidget {
  final ShoeVo shoeVo;

  const DetailScreen({super.key, required this.shoeVo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailViewModel(shoeVo),
      child: Consumer<DetailViewModel>(builder: (_, viewModel, __) {
        ShoeVo vo = viewModel.vo;
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              padding: EdgeInsets.only(left: 8),
              width: 180,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: hintColor,
                )),
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(side: BorderSide(color: hintColor)),
                  maximumSize: Size(20, 20),
                  minimumSize: Size(10, 10),
                  side: BorderSide(color: Color(0xfff7f7f7)),
                  padding: EdgeInsets.only(left: 6),
                ),
              ),
            ),
            elevation: 0,
            actions: [
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {
                    viewModel.onAddWishList();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.only(top: 2),
                  ),
                  child: Center(
                      child: Icon(
                    viewModel.isWishList?
                        Icons.favorite
                        : Icons.favorite_border,
                    color: primaryColor,
                  )),
                ),
              ),
              const SizedBox(
                width: kDefaultMarginWidth,
              )
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultMarginWidth,
                vertical: kDefaultMarginHeight),
            children: [
              SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: CustomNetworkImage(
                    imageUrl: viewModel.vo.image?.original,
                    radius: 16,
                    boxFit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    vo.silhouette ?? "",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: hintColor),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: primaryColor,
                  ),
                  Text(
                    "(${4.5})",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: hintColor),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultMarginHeight),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      vo.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      "\$${vo.retailPrice ?? "0  "}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 17),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    (vo.country ?? []).join(","),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(vertical: kDefaultMarginHeight),
                width: double.infinity,
                child: ShoeSizeWidget(
                  detailViewModel: viewModel,
                ),
              ),
              _tileWidget(
                  context: context,
                  title: "Description",
                  subtitle: (vo.story ?? "").isEmpty
                      ? "Description is empty"
                      : vo.story ?? ""),
              const Divider(
                color: hintColor,
              ),
              _tileWidget(
                  context: context,
                  title: "Delivery price",
                  subtitle: "Not available in your area"),
              const Divider(
                color: hintColor,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: vo.color!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        viewModel.onSelectColor(index);
                      },
                      child: AnimatedContainer(
                        height: 42,
                        width: 42,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: vo.color![index].toColor(),
                            shape: BoxShape.circle),
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: Icon(Icons.check_rounded  ,
                            size: 24,
                            color: viewModel.selectedColor == index
                                ? primaryColor
                                : Colors.transparent),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 6,
                  ),
                ),
              ),

            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: kDefaultMarginWidth,right: kDefaultMarginWidth),
            height: 120,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterWidget(viewModel: viewModel,),
               const  SizedBox(height: 8,),
                SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){

                      FixWidget().showSnackBar(context: context, title: "Added to cart");
                    }, child: const Text("Add to cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),))),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _tileWidget(
    {required context, required String title, required String subtitle}) {
  return ListTileTheme(
    contentPadding: EdgeInsets.all(0),
    dense: true,
    horizontalTitleGap: 0.0,
    minLeadingWidth: 0,
    child: ExpansionTile(
      backgroundColor: Colors.transparent,
      childrenPadding: EdgeInsets.all(0),
      tilePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      iconColor: textColor,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      children: [Text(subtitle)],
    ),
  );
}
