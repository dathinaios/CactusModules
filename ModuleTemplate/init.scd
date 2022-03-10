
{ arg module;
  "-> Initialising ModuleTemplate. This is 0_init.scd".postln;
  // setting up a variable in the module environment makes it available
  // to the run and cleanup file
  module.envir.someVar = "someVar. A random number:" + 300.rand;
  module.envir.someVar.postln;
}
