import 'package:exam_app/models/nutrition_model.dart';
import 'package:exam_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  bool isReceipt = false;
  bool isData = false;
  List<NutritionModel> nutritionList = [];

  Future<void> getData()async{
    isData = false;
    setState(() {});
    String? data = await HttpService.getMock();

    if(data!=null){
      nutritionList = nutritionModelFromJson(data);
      isData = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isData ? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 100),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  isReceipt = false;
                  setState(() {

                  });
                },
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                      color: !isReceipt ? const Color(0xFFFF9385) : const Color(0xFFFFF8EE),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Food",
                    style: GoogleFonts.signika(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: !isReceipt ? const Color(0xFFFFF8EE) : const Color(0xFFFF9385)
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  isReceipt = true;
                  setState(() {

                  });
                },
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                      color: !isReceipt ? const Color(0xFFFFF8EE) : const Color(0xFFFF9385),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Receipts",
                    style: GoogleFonts.signika(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: !isReceipt ? const Color(0xFFFF9385) : const Color(0xFFFFF8EE)
                    ),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          !isReceipt ? Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index)=>const SizedBox(height: 10),
              itemBuilder: (context, index){
                return Container(
                  height: 120,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEFF7EE),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),

                      Image.asset("assets/images/kosa.png"),

                      const SizedBox(width: 10),

                      Column(
                        children: [
                          const SizedBox(height: 15),

                          Text(
                            "${nutritionList[index].calories} Kcal",
                            style: GoogleFonts.signika(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: const Color(0xFF6CB663)
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "${nutritionList[index].name}",
                            style: GoogleFonts.signika(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: const Color(0xFF2E2E2E)
                            ),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Sugar amount: ${nutritionList[index].sugarG}g",
                            style: GoogleFonts.signika(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: const Color(0xFF767676)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: nutritionList.length,
            ),
          ) : Center(
            child: Text(
              "There is no any receipt yet",
              style: GoogleFonts.signika(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/savat.png")),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "No Results Found",
              style: GoogleFonts.signika(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: const Color(0xFF696969)
              ),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "Try searching for a different keywork\n          or tweek your search a little",
              style: GoogleFonts.signika(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFFA9A9A9)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
