
{
  arg module, freq;
  "I am in run.scd".postln;
  module.postln;
  module.name.postln;
  Synth(\TestModuleSynth, [\freq, freq]);
}
