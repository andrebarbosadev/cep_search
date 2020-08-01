class CepController < ApplicationController
  before_action :authorize_request

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

        auth_data = JsonWebToken.decode(request.authorization)

        if (!JSON.parse(@result.body).empty?)
          data = JSON.parse(@result.body)

          @user = User.find(auth_data['user_id'])

          @result = @user.search_history.create(data)

          render json: data, status: :ok
        else
          render json: { message: "Sem enderecos para o CEP informado: " + cep}
        end
      rescue HTTParty.Error
        render json: { message: "Ops, problemas ao buscar o seguinte CEP: " + cep}
      rescue StandardError
        render json: { message: "Erro ao consultar CEP, por favor tente novamente." }
      end
    else
      render json: { message: "CEP informado no formato incorreto: " + cep}
    end
  end

  # GET /cep/history
  def history
    @sh = SearchHistory.all
    render json: @sh, status: :ok
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
