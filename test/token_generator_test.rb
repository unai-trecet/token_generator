require 'test_helper'

class TokenGenerator::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, TokenGenerator
  end

  test "generates a token for a created object" do
    letter_to_home = Letter.create(address: 'Markusstrasse1')
    assert_equal true, letter_to_home.security_token.present?
  end

  test "matchs default token format" do
    # Default format: { block_length: 4, separator: '-', blocks_number: 2, attribute: 'identify' }
    cheap_stamp = Stamp.create(price: '1')

    assert_equal true, cheap_stamp.identify.present?
    assert_match /[A-Z]{4}-[A-Z]{4}/, cheap_stamp.identify
  end

  test "matchs model's custom token format" do
    # Format set in Box model: { block_length: 6, separator: ':', blocks_number: 3, attribute: 'albaran' }
    box_to_home = Box.create(address: 'Terracestrasse3')
    assert_match /[A-Z]{6}:[A-Z]{6}:[A-Z]{6}/, box_to_home.albaran
  end

  test "does not overwrite the token if it already exist" do
    letter_to_home = Letter.create(address: 'Markusstrasse4')
    existing_token = letter_to_home.security_token
    letter_to_home.update(address: 'Otherstrasse')

    assert_equal existing_token, letter_to_home.security_token
  end

end
