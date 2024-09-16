require 'rails_helper'

RSpec.describe "Asteroid Model" do
  let(:asteroid) { Asteroid.new(title: 'Apophis', description: 'The end of the world!') }

  it "should be invalid if title is nil" do
    asteroid.title = nil
    expect(asteroid.valid?).to eq false
  end

  it "should be invalid if title is empty" do
    asteroid.title = ""
    expect(asteroid.valid?).to eq false
  end

  it "should be invalid if description is nil" do
    asteroid.description = nil
    expect(asteroid.valid?).to eq false
  end

  it "should be invalid if description is empty" do
    asteroid.description = ''
    expect(asteroid.valid?).to eq false
  end

  it "should be valid if title length is lesser than 50 characters" do
    expect(asteroid.valid?).to eq true
  end

  it "should be invalid if title length is greater than 50 characters" do
    asteroid.title = "a" * 51
    expect(asteroid.valid?).to eq false
  end

  it "should be valid if description length is lesser than 2000 characters" do
    asteroid.description = "a" * Random.new.rand(2000)
    expect(asteroid.valid?).to eq true
  end

  it "should be invalid if value length is greater than 2000 characters" do
    asteroid.description = "a" * Random.new.rand(2001...2020)
    expect(asteroid.valid?).to eq false
  end
end