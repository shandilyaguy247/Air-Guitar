# Air Guitar

## Motivation

Digital Signal Processing, is a field of signal processing that aids and improves the accuracy and reliability of digital communications. One of the primary areas of applications is audio signal processing. A considerable amount of practice is required to be able play a guitar but the aim of the project is to bridge this gap and to allow everyone to be able to create music.

## Tech

Built with:
* MATLAB

## Hardware

A capacitive touch pad to select the chords and a gyroscope to sense movement of the hand. Both of them will create an API to send data to the computer. NodeMCU is an open source IOT platform. It includes firmware which runs on the sergsESP8266 WiFi, SoC from Espressif Systems, and hardware which is based on the ESP-12 module. It can be conveniently be programmed using the Arduino IDE.

The MPU-6050 combines a MEMS 3-axis gyroscope and a 3-axis accelerometer on the same silicon die together with an onboard Digital Motion Processor™ (DMP™) capable of processing complex 9-axis MotionFusion algorithms, the MPU-6050 does away with the cross-axis alignment problems that can creep up on discrete parts. The MPU-6050 incorporates InvenSense’s MotionFusion™ and run-time calibration firmware that enables manufacturers to eliminate the costly and complex selection, qualification, and system level integration of discrete devices in motion-enabled products, guaranteeing that sensor fusion algorithms and calibration procedures deliver optimal performance for consumers. The 8 button capacitive keypad is a low cost, sensitive touch pad. It is packaged in a breakout board. The keypad has 8 GPIO pins which can be directly be digitally read.

## Introduction

There are many techniques currently used for digital music synthesis, including frequency modulation synthesis, wave shaping, additive synthesis, and subtractive synthesis. To achieve rich, natural sounds, all of them require fast arithmetic capability, such as is found on expensive computers or digital synthesizers. For musicians and experimenters without access to these machines, musically interesting digital synthesis has been almost impossible. The algorithm offers a cheap to implement, easy to control, and pleasant to hear method. For musicians interested primarily in performing and composing music, rather than designing instruments, these algorithms provide a welcome new technique.

When a guitar string is plucked or strummed, it produces a sound wave with peaks in the frequency domain that are equally spaced. These are called the harmonics and they give each note a full sound. We can generate sound waves with these harmonics with discretetime filter objects. We use Fast Fourier Transform (FFT), FIR filters, delays and other digital processing techniques in this project to generate the music.

## Working

We use the Karplus-Strong algorithm as a reference for string sound synthesis. A guitar string vibrates at all harmonic frequencies when plucked, to generate this, we create a Finite Impulse Response (FIR) Filter.

We then pass white noise into the filter to get an output shaped input desired shape. The system is given a short excitation, a burst of white noise, which can be rapid sine wave chirp or frequency sweep, or a single cycle of a sawtooth wave or square wave. This excitation is output and simultaneously fed back into a delay line L samples long (This L determines the frequency of the sound). The required delay D for a given fundamental frequency F0 is calculated according to D = Fs/F0 where Fs is the sampling frequency. The output of the delay line is fed through a filter. The gain of the filter must be less than 1 at all frequencies, to maintain a stable positive feedback loop. The filter characteristics are crucial in determining the harmonic structure of the decaying tone. The filtered output is simultaneously mixed back into the output and fed back into the delay line. Either IIR or FIR filters may be used, but FIR have the advantage that transients are suppressed if the fractional delay is changed over time.

To simulate different kinds of guitar effects in MATLAB, we created different functions by reverse engineering existing effect controllers. The effects we incorporated were:

* Distortion
* Flanger
* Tremblo 
* Digital Delay

## Usage

There are 7 parts of the code, each as an individual .m file.

* The Primary_Code is the essential backbone
* Create_Sound is also essential
* Add_Effects is to be able to add the 4 effects:
    * Distortion 
    * Flanger 
    * Tremblo
    * Digital Delay


## Contributing
Pull requests and any corrections to the codes are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Credits

* Digital Synthesis of Plucked-String and Drum Timbres. Author(s): Kevin Karplus and Alex Strong. Source: Computer Music Journal, Vol. 7, No. 2 (Summer, 1983)

* Guitar Effects in MATLAB, Ethan Lusterman, The Cooper Union, New York, NY 2012

* https://in.mathworks.com/help/signal/examples/generating-guitar-chords-usingthe-karplus-strong-algorithm.html
