require 'rspec'
require_relative '../roman'

describe "Roman numerals" do

  def self.romanize_additive( arabic, roman )
    specify "#{arabic} --> #{roman}" do
      expect( arabic.to_roman.additive ).to eq( roman )
    end
  end

  def self.romanize_subtractive( arabic, roman )
    specify "#{arabic} --> #{roman}" do
      expect( arabic.to_roman.subtractive ).to eq( roman )
    end
  end

  it "only converts numbers up to 3,999" do
    expect { 4000.to_roman }.to raise_error ArgumentError
  end

  ### Additive numbers
  romanize_additive    1, 'I'
  romanize_additive    2, 'II'
  romanize_additive    3, 'III'
  romanize_additive    4, 'IV'
  romanize_additive    5, 'V'
  romanize_additive    6, 'VI'
  romanize_additive    7, 'VII'
  romanize_additive    8, 'VIII'
  romanize_additive    9, 'IX'
  romanize_additive   10, 'X'
  romanize_additive   27, 'XXVII'
  romanize_additive   48, 'XLVIII'
  romanize_additive   59, 'LIX'
  romanize_additive   93, 'XCIII'
  romanize_additive  141, 'CXLI'
  romanize_additive  163, 'CLXIII'
  romanize_additive  402, 'CDII'
  romanize_additive  575, 'DLXXV'
  romanize_additive  911, 'CMXI'
  romanize_additive 1024, 'MXXIV'
  romanize_additive 3000, 'MMM'

  ### Subtractive numbers
  romanize_subtractive    1, 'I'
  romanize_subtractive    2, 'II'
  romanize_subtractive    3, 'III'
  romanize_subtractive    4, 'IIII'
  romanize_subtractive    5, 'V'
  romanize_subtractive    6, 'VI'
  romanize_subtractive    7, 'VII'
  romanize_subtractive    8, 'VIII'
  romanize_subtractive    9, 'VIIII'
  romanize_subtractive   10, 'X'
  romanize_subtractive   27, 'XXVII'
  romanize_subtractive   48, 'XXXXVIII'
  romanize_subtractive   59, 'LVIIII'
  romanize_subtractive   93, 'LXXXXIII'
  romanize_subtractive  141, 'CXXXXI'
  romanize_subtractive  163, 'CLXIII'
  romanize_subtractive  402, 'CCCCII'
  romanize_subtractive  575, 'DLXXV'
  romanize_subtractive  911, 'DCCCCXI'
  romanize_subtractive 1024, 'MXXIIII'
  romanize_subtractive 3000, 'MMM'

end
