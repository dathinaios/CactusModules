
{
  arg note = [33, 40], dec = 2, amp = 0.6,
  out = 0, pos = 0, dur = 2, fadeTime, module;

  Pdef(\xSin,
    Pbind(
      \instrument, \clickedSin,
      \note, note,
      \dec, dec,
      \amp, amp,
      \out, out,
      \pos, pos,
      \dur, dur
    )
  ).fadeTime_(fadeTime).play;
}
