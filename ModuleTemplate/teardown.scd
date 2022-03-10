{ arg modules;
  "This is the file that is cleaning once all the general resources for each module".postln;
  modules.envir.test.debug("value from setup:")
}
