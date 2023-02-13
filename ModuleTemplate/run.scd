
{
  // Use this structure to pass arguments to your modules
  //module and modules need to be the last two arguments
  arg a, b, module, modules;

  // the argument "module" is reserved to hold the module instance
  module.postln;
  // you can use it to store variables local to the module
  module.envir.active = true;

  // the argument "modules" is reserved to hold the modules instance
  modules.postln;
  // you can use it to store variables shared by all modules
  modules.envir.usefulVar = 1111;
  // remember that we defined a variable in init.scd too
  modules.envir.moduleTemplateVar1.debug("From run.scd");

  // check if there are valules in the arguments
  a ?? {a = "no argument passed for a"};
  b ?? {b = "no argument passed for b"};
  // print the values of the arguments
  a.debug("This is arg a");
  b.debug("This is arg b");

  "Here we return a string but normally we would return something sound related"

}
