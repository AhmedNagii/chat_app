class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  @override
  Widget build(BuildContext context) {
    return   CircleAvatar(
                    radius: 50,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.image),
                    label: Text('Add an Image'),
                  ),
  }
}