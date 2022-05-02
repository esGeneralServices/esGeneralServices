class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.all.where(id: params[:id]).first
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_index_path  , notice: "Cliente apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  def delete
    @cliente = Cliente.where("id = ?", params[:id]).first
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to root_path(:notice =>"Cliente deletado com sucesso")}
    end
  end

  private
  def cliente_params
    params.require(:cliente).permit(:nome, :cpf, :email, :cep, :cidade, :bairro, :logradouro, :complemento, :password, :password_confirmation)
  end
end