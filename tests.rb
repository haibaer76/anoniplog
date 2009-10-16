require 'test/unit'
require 'ip_address_parser'

class SimpleTestIpAddressParser < Test::Unit::TestCase

  def setup
    @parser = IpAddressParser.new("first test 123.45.67.89 more stuff")
  end

  def test_ip_address_found
    assert_equal @parser.ip_addresses.size, 1
    assert_equal @parser.ip_addresses.first, "123.45.67.89"
  end
end

