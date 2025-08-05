require "application_system_test_case"

class ComerciosTest < ApplicationSystemTestCase
  setup do
    @comercio = comercios(:one)
  end

  test "visiting the index" do
    visit comercios_url
    assert_selector "h1", text: "Comercios"
  end

  test "should create comercio" do
    visit comercios_url
    click_on "New comercio"

    fill_in "Direccion", with: @comercio.direccion
    fill_in "Latitud", with: @comercio.latitud
    fill_in "Longitud", with: @comercio.longitud
    fill_in "Nombre", with: @comercio.nombre
    click_on "Create Comercio"

    assert_text "Comercio was successfully created"
    click_on "Back"
  end

  test "should update Comercio" do
    visit comercio_url(@comercio)
    click_on "Edit this comercio", match: :first

    fill_in "Direccion", with: @comercio.direccion
    fill_in "Latitud", with: @comercio.latitud
    fill_in "Longitud", with: @comercio.longitud
    fill_in "Nombre", with: @comercio.nombre
    click_on "Update Comercio"

    assert_text "Comercio was successfully updated"
    click_on "Back"
  end

  test "should destroy Comercio" do
    visit comercio_url(@comercio)
    accept_confirm { click_on "Destroy this comercio", match: :first }

    assert_text "Comercio was successfully destroyed"
  end
end
