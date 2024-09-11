import 'package:flutter/material.dart';

void main() => runApp(const ProductFormApp());

class ProductFormApp extends StatelessWidget {
  const ProductFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductFormScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class ProductFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar Producto'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField('Código'),
              const SizedBox(height: 15),
              _buildTextField('Nombre del producto'),
              const SizedBox(height: 15),
              _buildTextField('Descripción', maxLines: 3),
              const SizedBox(height: 15),
              _buildTextField('Cantidad', inputType: TextInputType.number),
              const SizedBox(height: 15),
              _buildTextField('Stock Máximo', inputType: TextInputType.number),
              const SizedBox(height: 15),
              _buildTextField('Stock Mínimo', inputType: TextInputType.number),
              const SizedBox(height: 15),
              _buildTextField('Precio',
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true)),
              const SizedBox(height: 15),
              _buildDropdownField(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Actualizar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {int maxLines = 1, TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.all(16.0),
        labelStyle: const TextStyle(fontSize: 16),
      ),
      maxLines: maxLines,
      keyboardType: inputType,
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Categoría',
        contentPadding: EdgeInsets.all(16.0),
        labelStyle: TextStyle(fontSize: 16),
      ),
      items: const [
        DropdownMenuItem(value: '0000', child: Text('Hogar')),
        DropdownMenuItem(value: '0001', child: Text('Jardinería')),
        DropdownMenuItem(value: '0002', child: Text('Electricidad')),
        DropdownMenuItem(value: '0003', child: Text('Plomería')),
        DropdownMenuItem(value: '0004', child: Text('Mecánica')),
        DropdownMenuItem(value: '0005', child: Text('Electrónica')),
      ],
      onChanged: (value) {},
    );
  }
}
