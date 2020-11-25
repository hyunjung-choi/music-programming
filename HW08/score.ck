BPM tempo;
tempo.tempo(120.0);

Machine.add(me.dir()+"/kick.ck") => int kickID;

8.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/snare.ck") => int snareID;

8.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/hihat.ck") => int hatID;
Machine.add(me.dir()+"/cowbell.ck") => int cowID;

8.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/clap.ck") => int clapID;

8.0 * tempo.quarterNote => now;

<<< "Set tempo to 80BPM" >>>;
80.0 => float newtempo;

tempo.tempo(newtempo);
8.0 * tempo.quarterNote => now;

<<< "Now set tempo to 160BPM" >>>;
160.0 => newtempo;
tempo.tempo(newtempo);
8.0 * tempo.quarterNote => now;

<<< "Gradually decrease tempo" >>>;
while (newtempo > 60.0) {

    newtempo - 20 => newtempo;
    tempo.tempo(newtempo);
    <<< "tempo = ", newtempo >>>;
    4.0 * tempo.quarterNote => now;
}

Machine.remove(kickID);

8.0 * tempo.quarterNote => now;
Machine.remove(snareID);
Machine.remove(hatID);

8.0 * tempo.quarterNote => now;
Machine.remove(cowID);

8.0 * tempo.quarterNote => now;
Machine.remove(clapID);
