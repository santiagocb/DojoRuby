class Apply < ApplicationRecord
    # tabla = applies
    # applies.title, applies.nombre

    def productor(asunto, body, name)
        #!/usr/bin/env ruby
        connection = Bunny.new(automatically_recover: false)
        connection.start
        channel = connection.create_channel
        queue = channel.queue('colaDojo', durable: true)
        message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')
        queue.publish("Asunto: "+asunto+" Solicitud: "+body+" Realizada por: "+name, persistent: true)
        connection.close
    end
end