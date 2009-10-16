require 'test/unit'
require 'ip_address_parser'

class SimpleTestIpAddressParser < Test::Unit::TestCase

  def setup
    @parser = IpAddressParser.new("first test 123.45.67.89 more stuff other_ip: 98.76.54.32")
  end

  def test_ip_address_found
    assert_equal @parser.ip_addresses.size, 2
    assert_equal @parser.ip_addresses.first, "123.45.67.89"
    assert_equal @parser.ip_addresses[1], "98.76.54.32"
  end
end

