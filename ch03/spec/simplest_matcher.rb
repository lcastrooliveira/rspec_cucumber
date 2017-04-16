# Protocolo minimo de matcher do RSpec

require 'spec_helper'

class SimplestMatcher
  def matches?(actual)
    true
  end
end

describe 'The matcher protocol' do
  it 'has a #matches?(actual) method' do
    expect('anything').to simplest_matcher
  end
  def simplest_matcher
    SimplestMatcher.new
  end
end
