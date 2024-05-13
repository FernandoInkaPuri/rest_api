require 'sneakers'

class PolicyReceiverWorker
  include Sneakers::Worker

  from_queue 'create_policy'

  def work(msg)
    msg = JSON.parse(msg)
    segurado = Segurado.create(**msg["segurado"])
    veiculo = Veiculo.create(**msg["veiculo"])
    charge = Charge.create(**msg["charge"])

    Policy.create(
      data_emissao: msg["data_emissao"],
      data_fim_cobertura: msg["data_fim_cobertura"],
      segurado_id: segurado.id,
      veiculo_id: veiculo.id,
      charge_id: charge.id
    )

    puts "#{msg}"
    puts "FOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOIIIIIIIIII"
    ack!
  end
end