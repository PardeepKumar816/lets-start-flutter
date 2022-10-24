  Widget build(BuildContext context) {
return Scaffold(
  body: Align(
    alignment: Alignment.center,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text('Button 1'),
          onPressed: () {},
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Button 2'),
        ),
      ],
    ),
  ),
);
}
