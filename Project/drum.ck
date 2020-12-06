SndBuf snare => dac;
0.2 => snare.gain;

"C:/Users/hyunjung/Desktop/audio/snare_03.wav" => snare.read;

0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)

while (1) {
   for (0 => int beat; beat < 8; beat++) {
       if (beat == 2 || beat == 4 || beat == 6 || beat == 7) {
            0 => snare.pos;
        }
        en => now;
    }
}
