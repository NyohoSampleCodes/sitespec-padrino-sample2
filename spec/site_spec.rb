require File.expand_path("../../config/boot.rb", __FILE__)
require 'sitespec/rspec'
require './app/app'
require 'pry'
require 'pry-byebug'

Sitespec.configuration.build_path = '_site'

describe 'Sitespec' do
  let(:app) do
    Sample2::App
  end

  %w[
    /
  ].each do |path|
    describe "GET #{path}", :sitespec do
      it "returns 200" do
        expect(get(path).status).to eq 200
      end
    end
  end

  Dir.glob('public/images/*').each do |filepath|
    describe "GET #{filepath}", :sitespec do
      # require 'pry' ; binding.pry
      # break Sitespec::Artifact#create
      it "Generate a static image #{filepath}" do
        filename = filepath.match(/public\/images\/(.+)$/)[1]
        path = "/images/#{filename}"
        expect(get(path).status).to eq 200
      end
    end
  end
end
