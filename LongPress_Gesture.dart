class _MyCardWidgetState extends State<MyCardWidget> { 
Color bgColor = Colors.yellow; 
bool makeCircular = false; 

@override Widget build(BuildContext context) { 

return GestureDetector( 
	onLongPress: (){ 
		setState(() { makeCircular = !makeCircular; }); }, 
	child: Card( shape: makeCircular? 
			const CircleBorder(): const RoundedRectangleBorder(), 
		child: const SizedBox( height: 300, width: 300, ), 
		color: bgColor, 
		), 
	); 
} 
} 
