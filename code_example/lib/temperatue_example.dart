class _MyHomePageState extends State‹MyHomePage>
String pressure = "", humidity =“”,
 temperature = "", light =“”;
@override
initstate() {
super.initState();
getSensorData();

}
