require 'minitest/autorun'
require_relative '../encryption_engine'

class EncryptionEngineTest < Minitest::Test
  def test_it_encrypts_using_rot13
    engine = EncryptionEngine.new
    output = engine.encrypt("My Message", 13)
    assert_equal "Zl Zrffntr", output
  end

  def test_it_decrypts_using_rot13
    engine = EncryptionEngine.new
    output = engine.decrypt("Guvf vf zl frperg", 13)
    assert_equal "This is my secret", output
  end
end
