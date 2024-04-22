import 'package:flutter/material.dart';
import 'package:gapopo_media/controller/home_controller.dart';
import 'package:gapopo_media/view/full_screen_image.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {

    late double screenWidth; //= MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
     double itemWidth = 200; // Set your desired width for each item
    int crossAxisCount = screenWidth ~/ itemWidth;
     return ViewModelBuilder<HomeController>.reactive(viewModelBuilder: () {
      return HomeController();
    }, onModelReady: (model)  {
     
    }, builder: (context, model, child) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Gallery',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(             
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), )
                 ),
                child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:crossAxisCount,                                            
                                                mainAxisSpacing: 10,
                                                mainAxisExtent: 180,
                                                crossAxisSpacing: 10)
                                          ,
                                        itemCount: model.imageDetailsList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullScreenImage(image: model.imageDetailsList[index],),
              ),
            );
                                           
                                            },
                                            child: Container(
                                             
                                              padding:   const EdgeInsets.all(3.93),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.1),
                                                border: Border.all(color: Colors.black, width: 0.1),
                                                borderRadius: BorderRadius.circular(5.8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [                                              
                                                    Flexible(
                                                     flex: 20,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(6),
                                                        child: Image.network(
                                                          '${model.imageDetailsList[index].userImageURL}',
                                                          fit: BoxFit.cover,
                                                          height: 300,
                                                          width: 180,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 11,
                                                      child: Container(                                                      
                                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                          Text(model.imageDetailsList[index].tags.toString(), maxLines: 3,) ,    
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(model.imageDetailsList[index].likes.toString()) ,  
                                                                   const SizedBox(
              width: 5,
          ),
                                                                  Icon(Icons.thumb_up_alt_outlined),
                                                                 
                                                                ],
                                                              ),
                                                               Row(
                                                                children: [
                                                                   Text(model.imageDetailsList[index].views.toString()) ,  
  const SizedBox(
              width: 5,
          ),
                                                                  Icon(Icons.remove_red_eye_outlined)
                                                                ],
                                                              )

                                                            ],
                                                          )                                         
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                               
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              
              ),
            ),
          )
        ],
      )),
    );
    });
  }
}


