SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;
SawOsc voice => master;

"C:/Users/hyunjung/Desktop/audio/kick_01.wav" => kick.read;
"C:/Users/hyunjung/Desktop/audio/snare_01.wav" => snare.read;
"C:/Users/hyunjung/Desktop/audio/hihat_01.wav" => hihat.read;

0.3 => hihat.gain;
0.15::second => dur tempo;

[1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0] @=> int kick_hits[];
[0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1] @=> int snare_hits[];

while(true){
    0 => int beat;
    while(beat < kick_hits.cap()){
        playDrum(kick, kick_hits, beat);
        playDrum(snare, snare_hits, beat);
        playDrumRandom(hihat, 0, 1);
        leadVoice(voice, 3, 0.3, 60, 72);
        tempo => now;
        beat++;
    }
}

fun void leadVoice(Osc sound, int distance, float volume, int low, int high) {
    Math.random2(0,distance-1) => int play;
    Math.random2(low,high) => int note;
    if (play == 0) {
        Std.mtof(note) => sound.freq;
        volume => sound.gain;
    }
    else
        0.0 => sound.gain;
}

fun void playDrum(SndBuf drum, int hits[], int beat) {
    if (hits[beat])
        0 => drum.pos;
}

fun void playDrumRandom(SndBuf drum, int low, int high){
    if(Math.random2(low, high))
        0 => drum.pos;
}

