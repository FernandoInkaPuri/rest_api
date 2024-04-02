require 'sneakers'

class PolicyReceiverWorker
  include Sneakers::Worker

  from_queue 'create_policy'

  def work(msg)
    PostPolicy.call
    puts "#{msg}"
    puts "FOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOIIIIIIIIII"
    ack!
  end
end