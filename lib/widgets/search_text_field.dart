import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final bool readOnly;
  final bool autoFocus;
  final Function()? onTap;
  final Function(String)? onChanged;

  const SearchTextField({
    required this.readOnly,
    required this.autoFocus,
    this.onTap,
    this.onChanged,
    super.key,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final String hint = "Type here..";

  Widget _buildAndroid(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      cursorColor: black,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTextField(
      readOnly: widget.readOnly,
      autofocus: widget.autoFocus,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      placeholder: hint,
      placeholderStyle: const TextStyle(color: Colors.grey),
      prefix: const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
