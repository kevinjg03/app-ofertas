require "application_system_test_case"

class ListaDetallesTest < ApplicationSystemTestCase
  setup do
    @lista_detalle = lista_detalles(:one)
  end

  test "visiting the index" do
    visit lista_detalles_url
    assert_selector "h1", text: "Lista detalles"
  end

  test "should create lista detalle" do
    visit lista_detalles_url
    click_on "New lista detalle"

    fill_in "Cantidad", with: @lista_detalle.cantidad
    fill_in "Lista compra", with: @lista_detalle.lista_compra_id
    fill_in "Prioridad", with: @lista_detalle.prioridad
    fill_in "Producto", with: @lista_detalle.producto_id
    click_on "Create Lista detalle"

    assert_text "Lista detalle was successfully created"
    click_on "Back"
  end

  test "should update Lista detalle" do
    visit lista_detalle_url(@lista_detalle)
    click_on "Edit this lista detalle", match: :first

    fill_in "Cantidad", with: @lista_detalle.cantidad
    fill_in "Lista compra", with: @lista_detalle.lista_compra_id
    fill_in "Prioridad", with: @lista_detalle.prioridad
    fill_in "Producto", with: @lista_detalle.producto_id
    click_on "Update Lista detalle"

    assert_text "Lista detalle was successfully updated"
    click_on "Back"
  end

  test "should destroy Lista detalle" do
    visit lista_detalle_url(@lista_detalle)
    accept_confirm { click_on "Destroy this lista detalle", match: :first }

    assert_text "Lista detalle was successfully destroyed"
  end
end
