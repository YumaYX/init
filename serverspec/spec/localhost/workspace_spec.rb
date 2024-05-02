require 'spec_helper'

describe 'Check for the existence of /work/*' do
  it "should exist: /work/data exists" do
    expect(file("/work/data")).to be_directory
  end
end
