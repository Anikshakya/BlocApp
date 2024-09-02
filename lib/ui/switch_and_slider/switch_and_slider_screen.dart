import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_bloc.dart';
import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_event.dart';
import 'package:blocapp/bloc/switch_and_slider_bloc/switch_and_slider_state.dart';
import 'package:blocapp/ui/image_pick/image_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchAndSlider extends StatelessWidget {
  const SwitchAndSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch and Slider Bloc"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Notification"),
                const Spacer(),
                BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
                  buildWhen: (previous, current) => previous.isSwicth != current.isSwicth,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwicth,
                      onChanged: (value){
                        context.read<SwitchAndSliderBloc>().add(ToggleSwitch());
                      }
                    );
                  },
                )
              ],
            ),
            const SizedBox(height: 50,),
            // Color Contaier
            BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.deepPurple.withOpacity(state.sliderValue),
                );
              },
            ),
            const SizedBox(height: 40,),
            //Slider
            BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue, 
                  onChanged: (value) {
                    context.read<SwitchAndSliderBloc>().add(ToggleSlider(changedVal: value));
                  },
                );
              },
            ),
            const SizedBox(height: 80,),
            // Image Picker Page
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ImagePick(),));
              }, 
              child: const Text("Image Picker Page")
            ),
          ],
        ),
      ),
    );
  }
}