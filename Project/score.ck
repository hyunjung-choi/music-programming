Machine.add(me.dir() + "repeat.ck");
Machine.add(me.dir() + "player.ck");
Machine.add(me.dir() + "drum.ck") => int drumID;
Machine.add(me.dir() + "intro.ck");
0.2 * 8 * 8 :: second => now;
Machine.add(me.dir() + "melody.ck");
0.2 * 8 * 4 * 13 :: second => now;
Machine.remove(drumID);
Machine.add(me.dir() + "outro.ck");
