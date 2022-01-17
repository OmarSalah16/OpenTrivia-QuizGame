import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:open_trivia/models/category.dart';
import 'package:open_trivia/ui/pages/intro.dart';
import 'package:open_trivia/ui/widgets/quiz_options.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatelessWidget
{
  // final List<Color> tileColors =
  // [
  //   Colors.green,
  //   Colors.blue,
  //   Colors.purple,
  //   Colors.pink,
  //   Colors.indigo,
  //   Colors.lightBlue,
  //   Colors.amber,
  //   Colors.deepOrange,
  //   Colors.red,
  //   Colors.brown
  // ];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      drawer: Drawer
      (
        child: ListView
        (
          padding: EdgeInsets.zero,
          children:
          [
            const DrawerHeader
            (
              decoration: BoxDecoration
              (
                color: Colors.green,
              ),
              child: Text('Welcome, Guest.', style: TextStyle(fontSize: 20, color: Colors.white)),
              
            ),

            ListTile
            (
              title: const Text('App Introduction', style: TextStyle(fontSize: 20, color: Colors.indigo)),
              onTap: () {Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => IntroSliderPage() ) );},
            ),
            
            ListTile
            (
              title: const Text('v1.0', style: TextStyle(fontSize: 20, color: Colors.indigo)),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar
      (
        title: const Text
        (
          'OpenTrivia',
          style: TextStyle(fontSize: 25.0),
        ),
        elevation: 0,
      ),
      body: Stack
      (
        children: <Widget>
        [
          ClipPath
          (
            clipper: WaveClipperTwo(),
            child: Container
            (
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 200,
            ),
          ),
          
          CustomScrollView
          (
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>
            [
              const SliverToBoxAdapter
              (
                child: Padding
                (
                  padding: EdgeInsets.symmetric
                  (
                    horizontal: 16.0, vertical: 8.0),
                    child: Text
                    (
                      "Select a category to start the quiz",
                      style: TextStyle
                      (
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 19.0
                      )
                  ),
                ),
              ),
              
              SliverPadding
              (
                padding: const EdgeInsets.all(10.0),
                sliver: SliverGrid
                (
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                  (
                    // MediaQuery.of(context).size.width > 1000 ? 7 : MediaQuery.of(context).size.width > 600 ? 5 : 2 (Cross Axis Count)
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0
                  ),
                  delegate: SliverChildBuilderDelegate
                  (
                    _buildCategoryItem,
                    childCount: categories.length,
                  )
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index)
  {
    Category category = categories[index];
    return MaterialButton
    (
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      color: Colors.indigo.shade700,
      textColor: Colors.white,
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          Icon(category.icon),
          const SizedBox(height: 10.0),
          AutoSizeText
          (
            category.name,
            minFontSize: 13.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category)
  {
    showModalBottomSheet
    (
      context: context,
      builder: (sheetContext) => BottomSheet
      (
        builder: (_) => QuizOptionsDialog(category: category),
        onClosing: () {},
      ),
    );
  }
}
