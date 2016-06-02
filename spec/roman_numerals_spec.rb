require 'rspec'
require_relative '../roman'

describe "Roman numerals" do

  def self.romanize( arabic, roman )
    specify "#{arabic} --> #{roman}" do
      expect( arabic.to_roman ).to eq( roman )
    end
  end

  romanize    1, 'I'
  romanize    2, 'II'
  romanize    3, 'III'
  romanize    4, 'IV'
  romanize    5, 'V'
  romanize    6, 'VI'
  romanize    7, 'VII'
  romanize    8, 'VIII'
  romanize    9, 'IX'
  romanize   10, 'X'
  romanize   27, 'XXVII'
  romanize   48, 'XLVIII'
  romanize   59, 'LIX'
  romanize   93, 'XCIII'
  romanize  141, 'CXLI'
  romanize  163, 'CLXIII'
  romanize  402, 'CDII'
  romanize  575, 'DLXXV'
  romanize  911, 'CMXI'
  romanize 1024, 'MXXIV'
  romanize 3000, 'MMM'

end
