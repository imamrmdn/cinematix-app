part of 'widgets.dart';

class TextInputForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final Color color;
  final Function onChanged;

  TextInputForm({
    this.hintText,
    this.labelText,
    this.controller,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.color,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: blackTextFont,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
