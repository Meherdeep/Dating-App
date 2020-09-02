import 'package:dating_app/data/bio.dart';
import 'package:dating_app/data/gender.dart';
import 'package:dating_app/helper/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YourDetails extends StatefulWidget {
  final Function onAddButtonTapped;
  YourDetails(this.onAddButtonTapped);
  @override
  _YourDetailsState createState() => _YourDetailsState();
}

enum genders {male,female}
enum sexuality {heterosexual, bisexual, gay, lesbian}

class _YourDetailsState extends State<YourDetails> {
  genders _gen = genders.female; 
  sexuality _sex = sexuality.heterosexual;
  bool isFemale = true;
  bool isMale = false;
  bool isBisexual = false;
  bool isGay = false;
  bool isLesbian = false;
  bool isHetersexual = true;
  int isSelected = 0;
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();
  List<String> interests = ['Eating','Partying','Exercise','Sports','Video Games','Sleeping','Eating','Photography']; 
  List<String> selectedInterests = [];
  List<String> interestsImages = ['assets/interest2.jpg', 'assets/interest3.jpg','assets/interest8.jpg','assets/interest1.jpg','assets/interest7.jpg','assets/interest4.jpg','assets/interest6.jpg','assets/interest5.jpg'];
  List<int> selectedValues = [];


  @override
  void dispose() { 
    selectedValues.clear();
    selectedInterests.clear();
    isSelected = 0;
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('01', style: signUpHeaderTextStyle.copyWith(fontSize: 40),),
                Text('Your details', style: signUpHeaderTextStyle.copyWith(fontSize: 25)),
                SizedBox(height: 20),
                
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Who are you?', style: dilutedText), 
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: genders.female, 
                          groupValue: _gen, 
                          onChanged: (genders value){
                          setState(() {
                            _gen = value;
                            isFemale = true;
                            isMale = false;
                            gender = 'Female';
                          });
                          }
                        ),
                        Image.asset(
                          'assets/female.png',
                          color: isFemale? null: Colors.black54,
                            height: MediaQuery.of(context).size.height*0.1,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: genders.male, 
                          groupValue: _gen, 
                          onChanged: (genders value){
                          setState(() {
                            _gen = value;
                            isFemale = false;
                            isMale = true;
                            gender = 'Male';
                          });
                          }
                        ),
                        Image.asset(
                          'assets/male.png',
                          color: isMale? null: Colors.black54,
                            height: MediaQuery.of(context).size.height*0.1,
                        ),
                      ],
                    ),
                ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Name', style: dilutedText,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'John Doe',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Age', style: dilutedText,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15),
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '21',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('What\'s your sexual orientation?', style: dilutedText,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.014,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.11,
              child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: sexuality.heterosexual, 
                          groupValue: _sex, 
                          onChanged: (sexuality value){
                          setState(() {
                            _sex = value;
                            isHetersexual = true;
                            isLesbian = isGay = isBisexual = false;
                          });
                          }
                        ),
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/heterosexual.svg',
                              color: isHetersexual? null: Colors.black54,
                              height: MediaQuery.of(context).size.height*0.07,
                            ),
                            Text('Heterosexual', style: dilutedText)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: sexuality.bisexual, 
                          groupValue: _sex, 
                          onChanged: (sexuality value){
                          setState(() {
                            _sex = value;
                            isBisexual = true;
                            isLesbian = isGay = isHetersexual = false;
                          });
                          }
                        ),
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/bisexual.svg',
                              color: isBisexual? null: Colors.black54,
                              height: MediaQuery.of(context).size.height*0.07,
                            ),
                            Text('Bisexual', style: dilutedText)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: sexuality.gay, 
                          groupValue: _sex, 
                          onChanged: (sexuality value){
                          setState(() {
                            _sex = value;
                            isGay = true;
                            isLesbian = isBisexual = isHetersexual = false;
                          });
                          }
                        ),
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/bisexual.svg',
                              color: isGay? null: Colors.black54,
                              height: MediaQuery.of(context).size.height*0.07,
                            ),
                            Text('Gay', style: dilutedText)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: sexuality.lesbian, 
                          groupValue: _sex, 
                          onChanged: (sexuality value){
                          setState(() {
                            _sex = value;
                            isLesbian = true;
                            isGay = isBisexual = isHetersexual = false;
                          });
                          }
                        ),
                        Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/lesbian.svg',
                              color: isLesbian? null: Colors.black54,
                              height: MediaQuery.of(context).size.height*0.07,
                            ),
                            Text('Lesbian', style: dilutedText)
                          ],
                        ),
                      ],
                    ),
                ],
            ),
          
              ],
            ) 
          
            ) 
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Select all your interests', style: dilutedText,),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),

          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
            itemCount: interestsImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,  
            ), 
            itemBuilder: (BuildContext context, int index){
              return Stack(
                children: <Widget>[
                  Container(
                height: MediaQuery.of(context).size.height*0.30,
                width: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(interestsImages[index]),
                    fit: BoxFit.fill
                  ),
                ),
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      selectedInterests.add(interests[index]);
                      isSelected = index;
                      selectedValues.add(index);
                    });
                    print(selectedInterests);
                  }, 
                  child: (isSelected.compareTo(index) == 0)
                  ? Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                  )
                  : null
                  
                ),
              )
                ],
              );
            }
          ),
            )
          ),
          
          SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
            width: MediaQuery.of(context).size.width*0.3,
            color: Color(0xFFEF959F),
            child: MaterialButton(
            onPressed: (){
              userName = _name.text;
              widget.onAddButtonTapped(1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Next', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt, 
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
          ),
            )
          )
        ],
      ),
    ),
    scrollDirection: Axis.vertical,
    );   
    
    }

    
}