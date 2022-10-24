class _MyCardWidgetState extends State<MyCardWidget> { 
Color bgColor = Colors.yellow; 
@override Widget build(BuildContext context) { 
return GestureDetector( 
	onDoubleTap: (){ 
		setState(() { 
		bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)]; 
		}); 
	}, 
	child: Card( child: const SizedBox( height: 300, width: 300, ), 
		color: bgColor, 
		), 
	); 
} 
} 
