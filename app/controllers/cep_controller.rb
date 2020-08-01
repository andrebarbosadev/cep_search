class CepController < ApplicationController

  BASE_URL = 'http://cep.la/'

  # GET /cep/{cep}
  def search
    cep = cep_params[:cep]

    if (validate_cep(cep))
      begin
        @result = HTTParty.get(BASE_URL + cep,
          :headers => {
            "Accept"        => "application/json"
          })

        puts "Processing..."
        #render json: { message: "CEP Received: #{cep}" }
        if (!JSON.parse(@result.body).empty?)
          data = JSON.parse(@result.body)

          @user = User.find(1)
          #@search = SearchHistory.new(cep: data['cep'], address: data['logradouro'], neighborhood: data['bairro'], city: data['cidade'], state: data['uf'])
          #test = {cep: 'a', address: 'b', neighborhood: 'c', city: 'd', state: 'e'}
          @result = @user.search_history.create(data)

          puts "created..."

          render json: { message: "CEP valido: " + cep}
        else
          render json: { message: "Sem enderecos para o CEP informado: " + cep}
        end
      rescue HTTParty.Error
        render json: { message: "Ops, problemas ao buscar o seguinte CEP: " + cep}
      end
    else
      render json: { message: "CEP informado no formato incorreto: " + cep}
    end
  end


private
  def validate_cep(cep)
    !(cep.match(/\d{8}/) or cep.match(/\d{5}-\d{3}/) or cep.match(/\d{2}.\d{3}-\d{3}/)).nil?
  end

  def cep_params
    params.permit(
      :cep
    )
  end
end
