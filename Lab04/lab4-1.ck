SndBuf sound => dac;

["clap_01", "click_01", "click_02", 
 "cowbell_01", "hihat_01", "hihat_04", 
 "kick_01", "snare_01", "snare_02",
 "snare_03", "stereo_fx_01", "stereo_fx_03"] @=> string filename[];

for(0 => int i; i < 12; i++){
    <<< filename[i], sound.length()/44100 >>>;
    "C:/Users/hyunjung/Desktop/audio/" + filename[i] + ".wav" => sound.read;
    sound.length() => now;
    1 :: second => now;
}