// Oct 2021 
// Abstractions of some MIDI features in ChucK for easy live coding/laptop improv 
// Basically a time saver. Useful for improv that controls external synths (e.g. VST's in a DAW via the IAC driver on a Mac)  
public class MIDIpoly
{
    MidiOut mout;
    MidiOut mout2;
    MidiOut mout3;
    MidiOut mout4; 
    MidiOut mout5;
    MidiOut mout6; 
    mout.open(0);
    mout2.open(0);
    mout3.open(0);
    mout4.open(0);
    mout5.open(0);
    mout6.open(0);
    
    
    fun void voice1(int onOff, int MIDInote, int vel, float durr)  
    {
        
        int notePlay;
        MidiMsg msg;
        
        //    0x90 => msg.data1; // noteOn/off -  144 and higher gives noteOn, 128 - 143 == note off 
        
        if (onOff == 1)
            144 => notePlay;
        else
            128 => notePlay;
        
        notePlay  => msg.data1; // allows for 0 / 1 on off 
        MIDInote => msg.data2; // MIDI note
        vel => msg.data3; // velocity 
        mout.send(msg);
        
        durr::second => now;
        128 => msg.data1;
        
        
        
    }
    
    
    fun void voice2(int onOff, int MIDInote, int vel, float durr)
    {
        int notePlay;   
        MidiMsg msg2;
        
        if (onOff == 1)
            145 => notePlay;
        else
            129 => notePlay;
        notePlay => msg2.data1; // 
        MIDInote => msg2.data2;
        vel => msg2.data3;
        mout2.send(msg2);
        
        durr::second => now;
        129 => msg2.data1;
        
        
    }
    
    
    fun void voice3(int onOff, int MIDInote, int vel, float durr)
    {
        int notePlay;
        MidiMsg msg3;
        
        if (onOff == 1)
            146 => notePlay;
        else
            130 => notePlay;
        notePlay => msg3.data1; // 
        MIDInote => msg3.data2;
        vel => msg3.data3;
        mout3.send(msg3);
        
        durr::second => now;
        130 => msg3.data1;
        
        
    }
    
    fun void voice4(int onOff, int MIDInote, int vel,float durr)
    {
        int notePlay;
        MidiMsg msg4;
        
        if (onOff == 1)
            147 => notePlay;
        else
            131 => notePlay;
        
        notePlay => msg4.data1; 
        MIDInote=> msg4.data2;
        vel => msg4.data3;
        mout4.send(msg4);
        
        durr::second => now;
        131 => msg4.data1;
        
        
        
    }
    
    fun void voice5(int onOff, int MIDInote, int vel,float durr)
    {
        int notePlay;
        MidiMsg msg5;
        
        if (onOff == 1)
            148 => notePlay;
        else
            132 => notePlay;
        
        notePlay => msg5.data1; 
        MIDInote=> msg5.data2;
        vel => msg5.data3;
        mout5.send(msg5);
        
        durr::second => now;
        132 => msg5.data1;
        
        
        
    }
    
    fun void voice6(int onOff, int MIDInote, int vel,float durr)
    {
        int notePlay;
        MidiMsg msg6;
        
        if (onOff == 1)
            149 => notePlay;
        else
            133 => notePlay;
        
        notePlay => msg6.data1; 
        MIDInote=> msg6.data2;
        vel => msg6.data3;
        mout6.send(msg6);
        
        durr::second => now;
        133 => msg6.data1;
        
        
        
    }
    
    
    fun void MIDIvoices(int whichvoice, int onOff, int note, int vel, float durr)
    {
        if (whichvoice == 1)
            spork ~ voice1(onOff,note,vel,durr); // remove and then spork again for later ones 
        
        if (whichvoice == 2)
            spork ~ voice2(onOff,note,vel,durr);
        
        if (whichvoice == 3)
            spork ~ voice3(onOff,note,vel,durr);         
        if (whichvoice == 4)
            spork ~ voice4(onOff,note,vel,durr);  
        
        if (whichvoice == 5)
            spork ~ voice5(onOff,note,vel,durr);  
        
        if (whichvoice == 6)
            spork ~ voice6(onOff,note,vel,durr);
        
        
    }
    
}
