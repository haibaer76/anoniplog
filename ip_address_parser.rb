class IpAddressParser

  attr_reader :ip_addresses
  def initialize(line)
    pos=0
    @ip_addresses=[]
    re = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
    m = re.match line
    tmp = line
    while not m.nil?
      @ip_addresses << m[0]
      tmp = tmp[m.offset(0)[1], tmp.size]
      m = re.match tmp
    end
  end

end
