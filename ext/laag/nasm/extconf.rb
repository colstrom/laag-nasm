
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/nasm'

LAAG::BuildEnvironment
  .new(LAAG.nasm)
  .script do
  execute! :git, 'apply', File.expand_path(File.join(LAAG.nasm.gem_root, 'patches', 'Makefile.in.patch'))
  default!
end

create_makefile 'laag/nasm'
