require "application_system_test_case"

class RegistroPreciosTest < ApplicationSystemTestCase
  setup do
    @registro_precio = registro_precios(:one)
  end

  test "visiting the index" do
    visit registro_precios_url
    assert_selector "h1", text: "Registro precios"
  end

  test "should create registro precio" do
    visit registro_precios_url
    click_on "New registro precio"

    fill_in "Comercio", with: @registro_precio.comercio_id
    check "Es atipico" if @registro_precio.es_atipico
    fill_in "Estado registro", with: @registro_precio.estado_registro_id
    fill_in "Fecha registro", with: @registro_precio.fecha_registro
    fill_in "Foto ticket url", with: @registro_precio.foto_ticket_url
    fill_in "Latitud", with: @registro_precio.latitud
    fill_in "Longitud", with: @registro_precio.longitud
    fill_in "Moneda", with: @registro_precio.moneda
    fill_in "Precio", with: @registro_precio.precio
    fill_in "Producto", with: @registro_precio.producto_id
    fill_in "Usuario", with: @registro_precio.usuario_id
    click_on "Create Registro precio"

    assert_text "Registro precio was successfully created"
    click_on "Back"
  end

  test "should update Registro precio" do
    visit registro_precio_url(@registro_precio)
    click_on "Edit this registro precio", match: :first

    fill_in "Comercio", with: @registro_precio.comercio_id
    check "Es atipico" if @registro_precio.es_atipico
    fill_in "Estado registro", with: @registro_precio.estado_registro_id
    fill_in "Fecha registro", with: @registro_precio.fecha_registro.to_s
    fill_in "Foto ticket url", with: @registro_precio.foto_ticket_url
    fill_in "Latitud", with: @registro_precio.latitud
    fill_in "Longitud", with: @registro_precio.longitud
    fill_in "Moneda", with: @registro_precio.moneda
    fill_in "Precio", with: @registro_precio.precio
    fill_in "Producto", with: @registro_precio.producto_id
    fill_in "Usuario", with: @registro_precio.usuario_id
    click_on "Update Registro precio"

    assert_text "Registro precio was successfully updated"
    click_on "Back"
  end

  test "should destroy Registro precio" do
    visit registro_precio_url(@registro_precio)
    accept_confirm { click_on "Destroy this registro precio", match: :first }

    assert_text "Registro precio was successfully destroyed"
  end
end
