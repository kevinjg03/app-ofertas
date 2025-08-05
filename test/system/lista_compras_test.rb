require "application_system_test_case"

class ListaComprasTest < ApplicationSystemTestCase
  setup do
    @lista_compra = lista_compras(:one)
  end

  test "visiting the index" do
    visit lista_compras_url
    assert_selector "h1", text: "Lista compras"
  end

  test "should create lista compra" do
    visit lista_compras_url
    click_on "New lista compra"

    fill_in "Fecha creacion", with: @lista_compra.fecha_creacion
    fill_in "Nombre", with: @lista_compra.nombre
    fill_in "Usuario", with: @lista_compra.usuario_id
    click_on "Create Lista compra"

    assert_text "Lista compra was successfully created"
    click_on "Back"
  end

  test "should update Lista compra" do
    visit lista_compra_url(@lista_compra)
    click_on "Edit this lista compra", match: :first

    fill_in "Fecha creacion", with: @lista_compra.fecha_creacion.to_s
    fill_in "Nombre", with: @lista_compra.nombre
    fill_in "Usuario", with: @lista_compra.usuario_id
    click_on "Update Lista compra"

    assert_text "Lista compra was successfully updated"
    click_on "Back"
  end

  test "should destroy Lista compra" do
    visit lista_compra_url(@lista_compra)
    accept_confirm { click_on "Destroy this lista compra", match: :first }

    assert_text "Lista compra was successfully destroyed"
  end
end
