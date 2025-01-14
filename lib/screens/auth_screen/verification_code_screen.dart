import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vellato/screens/auth_screen/reset_password.dart';

import '../../themes/app_colors.dart';
import '../../widget/custom_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {


  int _remainingTime = 120; // 2 minutes in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_remainingTime == 0) {
          timer.cancel();
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      },
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minutesStr:$secondsStr';
  }


  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<String> _errors = List.generate(6, (index) => '');

  void DisposeFocus() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void disposeTextField() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _validateInput(String value) {
    // Implement your validation logic here
    return value.isNotEmpty && int.tryParse(value) != null; // Example: Check if the value is a non-empty number
  }

  bool _validateAllFields() {
    bool allValid = true;
    for (int i = 0; i < _controllers.length; i++) {
      if (!_validateInput(_controllers[i].text)) {
        setState(() {
          _errors[i] = 'Required';
        });
        allValid = false;
      } else {
        setState(() {
          _errors[i] = '';
        });
      }
    }
    return allValid;
  }

  void _onSubmit() {
    if (_validateAllFields()) {
     // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Opacity(
                    opacity: 0.50,
                    child: Text(
                      'Enter the verification code sent to your email address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 89,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child:

                            RawKeyboardListener(
                              focusNode: FocusNode(),
                              onKey: (RawKeyEvent event) {
                                if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
                                  if (_controllers[index].text.isEmpty && index > 0) {
                                    _focusNodes[index - 1].requestFocus();
                                    _controllers[index - 1].clear();
                                  }
                                }
                              },

                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                onChanged: (value) {
                                  if (_validateInput(value)) {
                                    _errors[index] = '';
                                    if (value.length == 1) {
                                      if (index < _focusNodes.length - 1) {
                                        _focusNodes[index + 1].requestFocus();
                                      } else {
                                        _focusNodes[index].unfocus();
                                      }
                                    }
                                  } else {
                                    _errors[index] = '';
                                  }
                                  setState(() {});
                                },
                                onFieldSubmitted: (_) {
                                  if (index < _focusNodes.length - 1) {
                                    _focusNodes[index + 1].requestFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                                decoration: InputDecoration(
                                  errorText: _errors[index].isNotEmpty ? _errors[index] : null,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  filled: true,
                                  fillColor: AppColors.borderColor.withOpacity(0.08),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade50,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),


                  const SizedBox(height: 169,),
                  CustomButton(title: 'Verify', onTap: _onSubmit),
                  const SizedBox(height: 47,),
                  _remainingTime!=0?
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('Re-send code in ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.32,
                        ),),
                      const SizedBox(width: 5,),
                      Text(
                        _formatTime(_remainingTime),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF6B1514),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ],
                  ):Container(),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


