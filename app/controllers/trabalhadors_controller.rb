class TrabalhadorsController < ApplicationController
  def index
    @trabalhadors = Trabalhador.all
  end

  def show
    @trabalhador = Trabalhador.all.where(id: params[:id]).first
  end

  def edit
  end

  def update
    respond_to do |format|
      if @trabalhador.update(trabalhador_params)
        format.html { redirect_to @trabalhador, notice: "Trabalhador was successfully updated." }
        format.json { render :show, status: :ok, location: @trabalhador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trabalhador.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trabalhador.destroy
    respond_to do |format|
      format.html { redirect_to trabaladors_index_path  , notice: "Trabalhador apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  def delete
    @trabalhador = Trabalhador.where("id = ?", params[:id]).first
    @trabalhador.destroy
    respond_to do |format|
      format.html { redirect_to root_path(:notice =>"Trabalhador deletado com sucesso")}
    end
  end

  private
  def trabalhador_params
    params.require(:trabalhador).permit(:nome, :cpf, :profissao, :email, :password, :password_confirmation)
  end
end
