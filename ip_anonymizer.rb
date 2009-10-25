require 'digest/sha1'

class IpAnonymizer
  def initialize(options={})
    @salt = options[:salt] || gen_salt
    @last_salt_gen = options[:last_salt_gen] || Time.now
    @timeout = options[:timeout] || 86400
  end

  def anon_ip ip_address
    now = Time.now
    if now.to_i-@last_salt_gen.to_i > @timeout
      @salt = gen_salt
      @last_salt_gen = now
    end
    Digest::SHA1.hexdigest "#{ip_address}#{@salt}"
  end

  private
  def gen_salt
    Digest::SHA1.hexdigest rand.to_s
  end
end

