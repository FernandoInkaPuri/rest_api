class PoliciesController < ApplicationController
  def index
    render json: all_policies
  end

  def show
    policy = Policy.find(params[:id])
    segurado = policy.segurado
    veiculo = policy.veiculo

    result = {
      "policy_id": policy.id,
      "data_emissao": policy.data_emissao,
      "data_fim_cobertura": policy.data_fim_cobertura,
      "status": policy.status,
      "segurado":{
        "nome": segurado.nome,
        "cpf": segurado.cpf
      },
      "veiculo":
      {
        "marca": veiculo.marca,
        "modelo": veiculo.modelo,
        "ano": veiculo.ano,
        "placa": veiculo.ano
      },
      "charge": {
        "payment_id": policy.charge.payment_id,
        "payment_link": policy.charge.payment_link
      }
    }

    render json: result
  end

  def all_policies
    policies = Policy.all

    policies.map do |policy|
      segurado = policy.segurado
      veiculo = policy.veiculo

      {
        "policy_id": policy.id,
        "data_emissao": policy.data_emissao,
        "data_fim_cobertura": policy.data_fim_cobertura,
        "status": policy.status,
        "segurado":{
          "nome": segurado.nome,
          "cpf": segurado.cpf
        },
        "veiculo":
        {
          "marca": veiculo.marca,
          "modelo": veiculo.modelo,
          "ano": veiculo.ano,
          "placa": veiculo.ano
        },
        "charge": {
          "payment_id": policy.charge.payment_id,
          "payment_link": policy.charge.payment_link
        }
      }
    end
  end
end