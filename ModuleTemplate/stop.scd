{ arg a, b, module, modules;

  // Just to show that we have acesss to the variable
  // we defined in run.scd
  if (module.envir.active, {
    module.envir.active = false;
    "module no longer active".postln;
  });

  // We still have access to modules
  modules.envir.usefulVar.debug("from stop.scd");

  // Whatever was returned from the function
  // at run.scd is stored in the soundProcess
  // instance variable.
  module.soundProcess.postln;
  
  // We still have access to the arguments
  a.debug("This is arg a");
  b.debug("This is arg b");
}
