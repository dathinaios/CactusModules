// this code will run before a restart 
{ arg modules;
  "-> calling cleanup on ModuleTemplate. This is cleanup.scd".postln;
  // setting up a variable in the modules 
  // environment makes it available to all modules
  modules.envir.moduleTemplateVar1 = 0;
}

