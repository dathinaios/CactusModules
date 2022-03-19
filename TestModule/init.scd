{ 
  "I am in init.scd for TestModule".postln;
  SynthDef(\TestModuleSynth, { arg freq = 25;
    Out.ar(0, Impulse.ar(freq, 0, 0.2;))
  }).add;
}
