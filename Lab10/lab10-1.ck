Hid hi;
HidMsg msg;

0 => int device;
if (!hi.openKeyboard(device)) {
    <<< "Can't open this device!" >>>;
    me.exit();
}
<<< "Keyboard is ready: ", hi.name() >>>;

BeeThree organ => JCRev r => dac;

while(true){
    hi => now;
    while(hi.recv(msg)){
        if(msg.isButtonDown()){
            <<< "key down: ", msg.ascii >>>;
            
            if(msg.ascii == 49)
                60 => Std.mtof => organ.freq;
            
            else if(msg.ascii == 50)
                62 => Std.mtof => organ.freq;
            
           else if(msg.ascii == 51)
                64 => Std.mtof => organ.freq;
           
           else if(msg.ascii == 52)
                65 => Std.mtof => organ.freq;
           
           else if(msg.ascii == 53)
                67 => Std.mtof => organ.freq;
           
           else continue;
               
           1 => organ.noteOn;
           80::ms => now;
        }
        else{
            <<< "key up: ", msg.ascii>>>;
            1 => organ.noteOff;
        }
    }
}