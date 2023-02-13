
{ arg modules;
  "-> Initialising ModuleTemplate. This is init.scd".postln;
  // setting up a variable in the modules 
  // environment makes it available to all modules
  modules.envir.moduleTemplateVar1 = "something defined in init";
}
