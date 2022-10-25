class FirstRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('First Route'),  
      ),  
      body: Center(  
        child: RaisedButton(  
          child: Text('Open route'),  
          onPressed: () {  
            // Navigate to second route when tapped.  
          },  
        ),  
      ),  
    );  
  }  
}  
  
class SecondRoute extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text("Second Route"),  
      ),  
      body: Center(  
        child: RaisedButton(  
          onPressed: () {  
            // Navigate back to first route when tapped.  
          },  
          child: Text('Go back!'),  
        ),  
      ),  
    );  
  }  
}  
