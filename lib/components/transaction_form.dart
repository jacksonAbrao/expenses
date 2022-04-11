// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Título",
              ),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: _valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? "Nenhuma data selecionada!"
                      : 'Data Selecionada: ${DateFormat('d/MM/y').format(_selectedDate)}'),
                ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: Text('Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      primary: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      )),
                  child: const Text("Nova Transação"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
