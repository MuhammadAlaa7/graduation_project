import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:graduation_project/Screens/show_result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    Future getImage() async {
      XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
      var imageFile = pickedImage!.path;
      print(imageFile);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Results(choosedImage: imageFile,)),
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              systemOverlayStyle:const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Kidney CT Classifier',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:  Color(0xff012256),
                ),
              ),
            ),
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/kidney.json',
                            fit: BoxFit.cover,
                            width: 350,
                          ),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsetsDirectional.only(bottom: 10.0),
                            child: ElevatedButton(
                              onPressed: getImage,
                              child: const Text('Choose an Image',style: TextStyle(fontSize: 16.0),),
                              style: ButtonStyle(
                                backgroundColor:MaterialStateProperty.all(Colors.orange),
                              ),
                            )
                          )
                        ],
                      ),
                  ],),
    );
  }
}
