
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  NASM_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  NASM_ORIGIN  = 'repo.or.cz/nasm'
  NASM_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-nasm-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(NASM_GEM_ROOT)
      .match(%r{^laag-nasm-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.nasm
    @@nasm ||= Library.new(
      gem_root: NASM_GEM_ROOT,
      origin:   NASM_ORIGIN,
      version:  NASM_VERSION
    )
  end
end
