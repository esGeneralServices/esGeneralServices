require "application_system_test_case"

class ServicosTest < ApplicationSystemTestCase
  setup do
    @servico = servicos(:one)
  end

  test "visiting the index" do
    visit servicos_url
    assert_selector "h1", text: "Servicos"
  end

  test "should create servico" do
    visit servicos_url
    click_on "New servico"

    fill_in "Dataservico", with: @servico.dataServico
    fill_in "Descricaoservico", with: @servico.descricaoServico
    fill_in "Endereco", with: @servico.endereco_id
    fill_in "Horafinal", with: @servico.horaFinal
    fill_in "Horainicio", with: @servico.horaInicio
    fill_in "Nomeservico", with: @servico.nomeServico
    fill_in "Tiposervico", with: @servico.tipoServico
    fill_in "Valorservico", with: @servico.valorServico
    click_on "Create Servico"

    assert_text "Servico was successfully created"
    click_on "Back"
  end

  test "should update Servico" do
    visit servico_url(@servico)
    click_on "Edit this servico", match: :first

    fill_in "Dataservico", with: @servico.dataServico
    fill_in "Descricaoservico", with: @servico.descricaoServico
    fill_in "Endereco", with: @servico.endereco_id
    fill_in "Horafinal", with: @servico.horaFinal
    fill_in "Horainicio", with: @servico.horaInicio
    fill_in "Nomeservico", with: @servico.nomeServico
    fill_in "Tiposervico", with: @servico.tipoServico
    fill_in "Valorservico", with: @servico.valorServico
    click_on "Update Servico"

    assert_text "Servico was successfully updated"
    click_on "Back"
  end

  test "should destroy Servico" do
    visit servico_url(@servico)
    click_on "Destroy this servico", match: :first

    assert_text "Servico was successfully destroyed"
  end
end
