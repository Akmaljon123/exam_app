import 'package:exam_app/models/nutrition_model.dart';
import 'package:exam_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  bool loading = false;
  List<NutritionModel>? nutritionModel;
  NutritionModel? nutrition;

  Future<void> search(String product)async{
    loading = false;
    setState(() {});
    String? data = await HttpService.get(
      param: {
        "query": product
      }
    );
    
    if(data!=null){
      nutritionModel = nutritionModelFromJson(data);
      nutrition = nutritionModel![0];
      loading = true;
      setState(() {});
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text(
              "No data found about this product",
            style: GoogleFonts.signika(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),
          ),
          backgroundColor: Colors.black,
        )
      );
      
      loading = true; setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70),

            Center(
              child: Text(
                "Hello Shambhavi",
                style: GoogleFonts.signika(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.greenAccent
                ),
              ),
            ),

            Center(
              child: Text(
                "Find, track and eat healthy food",
                style: GoogleFonts.signika(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.grey.shade900
                ),
              ),
            ),

            const SizedBox(height: 70),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF4F4F4),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.grey.shade900,
                  ),

                  suffixIcon: IconButton(
                    icon: const Icon(
                        Icons.done,
                        size: 24,
                      color: Colors.black,
                    ),
                    onPressed: ()async{
                      await search(controller.text);
                      await HttpService.post(nutrition!.toJson());
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                  ),

                  hintText: "Junk Food",
                  hintStyle: GoogleFonts.signika(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey.shade900
                  ),
                ),
              ),
            ),

            const SizedBox(height: 90),

            loading ? Column(
              children: [
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Name: ${nutrition!.name}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Calories: ${nutrition!.calories}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Fat: ${nutrition!.fatTotalG}g",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Sugar: ${nutrition!.sugarG}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Serving size: ${nutrition!.servingSizeG}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Fat saturated: ${nutrition!.fatSaturatedG}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Protein: ${nutrition!.proteinG}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      Text(
                        "Sodium: ${nutrition!.sodiumMg}",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                GestureDetector(
                  onTap: (){
                    loading = false;
                    controller.clear();
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                        "Back",
                        style: GoogleFonts.signika(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                    ),
                  ),
                )
              ],
            ) : Column(
              children: [
                Container(
                  height: 90,
                  width: 360,
                  decoration: BoxDecoration(
                      color: const Color(0xFFA3A0CA),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 35),

                      Text(
                        "Track Your\nWeekly Progress",
                        style: GoogleFonts.signika(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),

                      const SizedBox(width: 10),

                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),

                              Text(
                                "View now",
                                style: GoogleFonts.signika(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: const Color(0xFF9E9BC7)
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Icon(
                                Icons.play_arrow,
                                color: Color(0xFF9E9BC7),
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Choose Your Favorites",
                  style: GoogleFonts.signika(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.black
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const SizedBox(width: 50),
                    Container(
                      height: 145,
                      width: 135,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF2F0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/qulupnay.png"),

                          Text(
                            "Fruits",
                            style: GoogleFonts.signika(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xFF4D0A00)
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(width: 60),
                    Container(
                      height: 145,
                      width: 135,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF7EE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/vegatable.png"),

                          Text(
                            "Vegetables",
                            style: GoogleFonts.signika(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xFF1C3418)
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
