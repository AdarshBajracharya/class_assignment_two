import 'package:class_assignment_2/cubit/cube_volume_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeCubitView extends StatelessWidget {
  const VolumeCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController sideController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cube Volume Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: sideController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Side Length',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<VolumeCubit, double>(
              builder: (context, state) {
                return Text(
                  'Volume: ${state.toStringAsFixed(2)} cubic units',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final double? side = double.tryParse(sideController.text);
                if (side != null) {
                  context.read<VolumeCubit>().calculateVolume(side);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter a valid number!')),
                  );
                }
              },
              child: const Text('Calculate Volume'),
            ),
          ],
        ),
      ),
    );
  }
}
