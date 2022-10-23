class MyHomePageState extends State‹MyHomePage> {
double x = 0.0, y = 0.0, z = 0.0;
@override
void initstate() {
super.initState ();
userAccelerometerEvents.listen( (UserAccelerometerEvent event) {
setstate (0) 1
x = event.x;
y = event y;
z = event.z;
});
});
}
