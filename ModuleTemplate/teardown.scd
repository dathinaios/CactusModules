{ arg module;
  "This is the file that is cleaning once all the general resources for each module".postln;
  module.envir.test.debug("value from setup:")
}
