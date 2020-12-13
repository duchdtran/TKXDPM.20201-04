import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/app_button.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final cardNumberController = TextEditingController();
  final nameController = TextEditingController();
  final dueDateController = TextEditingController();
  final cvvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _saveCard = true;
  RegExp creditcardRegExp = RegExp(
      '^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})\$');
  RegExp dueDateRegExp = RegExp('[0-9][0-9]/[0-9][0-9]');
  RegExp cvvRegExp = RegExp('[0-9][0-9][0-9]');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Thêm thẻ mới',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text('Thêm thẻ tín dụng/ghi nợ mới'),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/images/visa.png',
                    width: 32, height: 32),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                    // ignore: file_names
                    'assets/images/mastercard.png',
                    width: 32,
                    height: 32),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: cardNumberController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: 'Số thẻ',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Trường này không thể trống';
                        }
                        // if (!creditcardRegExp.hasMatch(value)) {
                        //   return 'Số thẻ không hợp lệ';
                        // }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: 'Họ và tên',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Trường này không thể trống';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: TextFormField(
                            controller: dueDateController,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 14),
                              hintText: 'Ngày hết hạn',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Trường này không thể trống';
                              }
                              // if (!dueDateRegExp.hasMatch(value)) {
                              //   return 'Ngày hết hạn không hợp lệ';
                              // }
                              return null;
                            },
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: TextFormField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 14),
                              hintText: 'CVV',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Trường này không thể trống';
                              }
                              // if (!cvvRegExp.hasMatch(value)) {
                              //   return 'CVV không hợp lệ';
                              // }
                              return null;
                            },
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Lưu thẻ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Thông tin được mã hoá và lưu trữ an toàn.',
                                  style: TextStyle(color: Colors.grey[700]),
                                )
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: Switch(
                              value: _saveCard,
                              onChanged: (value) {
                                setState(() {
                                  _saveCard = value;
                                });
                              }),
                        )
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: _buildBottomWidget(_formKey, {
        'number': cardNumberController,
        'name': nameController,
        'due': dueDateController,
        'cvv': cvvController,
        'saveCard': _saveCard
      }),
    );
  }
}

Widget _buildBottomWidget(_formKey, controller) {
  return Container(
    height: 80,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: AppButton(
          title: 'Xác nhận',
          onPress: () {
            final form = _formKey.currentState;
            if (form.validate()) {
              // Print all form value
              print('Card number: ');
              print(controller['number'].value.text);
              print('Name: ');
              print(controller['name'].value.text);
              print('Due date: ');
              print(controller['due'].value.text);
              print('CVV: ');
              print(controller['cvv'].value.text);
              print('Save card? ');
              print(controller['saveCard']);

              // TODO:
              // Save card and continue checkout processing
            }
          },
        ),
      ),
    ),
  );
}
