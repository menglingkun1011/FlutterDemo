import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//class MyAppBar extends StatelessWidget{
//
//  final Widget title;
//
//    MyAppBar({this.title});
//
//
//    @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Container(
//      height: 56.0,
//      padding: const EdgeInsets.symmetric(horizontal:8.0),
//      decoration: new BoxDecoration(color: Colors.blue[500]),
//      child: new Row(
//        children: <Widget>[
//          new IconButton(
//              icon: new Icon(Icons.menu),
//              tooltip: "Navigation menu",
//              onPressed: null,
//          ),
//          new Expanded(
//            child: title,
//          ),
//          new IconButton(
//              icon: new Icon(Icons.search),
//              tooltip: "Search",
//              onPressed: null)
//        ],
//      ),
//    );
//  }
//}
//
//class MyScaffold extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // Material 是UI呈现的“一张纸”
//    return new Material(
//      // Column is 垂直方向的线性布局.
//      child: new Column(
//        children: <Widget>[
//          new MyAppBar(
//            title: new Text(
//              'Example title',
//              style: Theme.of(context).primaryTextTheme.title,
//            ),
//          ),
//          new Expanded(
//            child: new Center(
//              child: new Text('Hello, world!'),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//
//void main() => runApp(new MaterialApp(
//    title:"My app",
//    home: new MyScaffold(),
//));


//void main() {
//  runApp(new MaterialApp(
//    title: 'Flutter Tutorial',
//    home: new TutorialHome(),
//  ));
//}
//
//class TutorialHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    //Scaffold是Material中主要的布局组件.
//    return new Scaffold(
//      appBar: new AppBar(
//        leading: new IconButton(
//          icon: new Icon(Icons.menu),
//          tooltip: 'Navigation menu',
//          onPressed: null,
//        ),
//        title: new Text('Example title'),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
//      //body占屏幕的大部分
//      body: new Center(
//        child: new Text('Hello, world!'),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        tooltip: 'Add', // used by assistive technologies
//        child: new Icon(Icons.add),
//        onPressed: null,
//      ),
//    );
//  }
//}

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
//  runApp(new MaterialApp(
//    title: 'Shopping App',
//    home: new ShoppingList(
//      products: <Product>[
//        new Product(name: 'Eggs'),
//        new Product(name: 'Flour'),
//        new Product(name: 'Chocolate chips'),
//      ],
//    ),
//  ));

//    runApp(new Center(child: new Container(
//      margin: const EdgeInsets.all(10.0),
//      color: Colors.amber[600],
//      width: 48.0,
//      height: 48.0,
//    )));
      runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new RandomWordsState();

}

class RandomWordsState extends State<RandomWords>{

  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize:18.0);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(appBar: new AppBar(
      title: new Text('Startup Name Generator3333'),
    ),
    body: _buildSuggestions(),);
  }

  Widget _buildSuggestions(){
      return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context,i){

            if(i.isOdd) return new Divider();
            final index = i ~/ 2;
            if(index >= _suggestions.length){
              _suggestions.addAll(generateWordPairs().take(10));
            }

            return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair){
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

}



//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    WordPair wordPair = WordPair.random();
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter666'),
//        ),
//        body: new Center(
////          child: new Text('Hello World'),
//          child: new RandomWords(),
//        ),
//      ),
//    );
//  }
//}
//class RandomWords extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new RandomWordsState();
//  }
//
//}

//class RandomWordsState extends State<RandomWords> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final wordPair = WordPair.random();
//    return new Text(wordPair.asPascalCase);
//  }
//}

//
//void main() {
//  runApp(new MaterialApp(
//    title: 'Flutter Tutorial',
//    home: new Counter(),
//  ));
//}

//class MyButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new GestureDetector(
//      onTap: () {
//        print('MyButton was tapped!');
//      },
//      child: new Container(
//        height: 36.0,
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
//        decoration: new BoxDecoration(
//          borderRadius: new BorderRadius.circular(5.0),
//          color: Colors.lightGreen[500],
//        ),
//        child: new Center(
//          child: new Text('Engage'),
//        ),
//      ),
//    );
//  }
//}
//
//class Counter extends StatefulWidget{
//  @override
//  _Counter createState() {
//    // TODO: implement createState
//    return new _Counter();
//  }
//
//}
//
//class _Counter extends State<Counter>{
//
//  int _num = 0;
//
//  void _nunCount(){
//
//    setState(() {
//      _num ++;
//    });
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Row(children: <Widget>[
//
//      new RaisedButton(
//          onPressed: _nunCount,
//          child: new Text("我是RaisedButton"),
//
//      ),
//
//      new Text("counte:$_num")
//    ],);
//  }
//
//}
