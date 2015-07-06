# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tic_tac_toe_core/version'

Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe_core"
  spec.version       = TicTacToeCore::VERSION
  spec.authors       = ["Sam Han"]
  spec.email         = ["shan@8thlight.com"]

  spec.summary       = %q{Core logic for TicTacToe}
  spec.description   = %q{Handles the game state and running of the TicTacToe Game. Also contains an unbeatable AI.}
  spec.homepage      = "https://github.com/hanster/tic-tac-toe-core-simple"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
