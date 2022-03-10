
{ arg modules;
  "-> Seting up the ModuleTemplate. This setup file will be run only once when the module is installed or Cactus first loads.".postln;
  modules.envir.test = 200.rand;
  modules.envir.test.postln;
}
