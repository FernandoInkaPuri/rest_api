class PoliciesController < ApplicationController
  def show
    policy = Policy.find(params[:id])
    segurado = policy.segurado
    veiculo = policy.veiculo

    result = {
      "id": policy.id,
      "data_emissao": policy.data_emissao,
      "data_fim_cobertura": policy.data_fim_cobertura,
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
      }
    }

    render json: result
  end
end