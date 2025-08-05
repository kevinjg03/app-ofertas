require "application_system_test_case"

class PreferenciaTest < ApplicationSystemTestCase
  setup do
    @preferencium = preferencia(:one)
  end

  test "visiting the index" do
    visit preferencia_url
    assert_selector "h1", text: "Preferencia"
  end

  test "should create preferencium" do
    visit preferencia_url
    click_on "New preferencium"

    check "Recibir notificaciones" if @preferencium.recibir_notificaciones
    fill_in "Unidad monetaria", with: @preferencium.unidad_monetaria
    fill_in "Usuario", with: @preferencium.usuario_id
    click_on "Create Preferencium"

    assert_text "Preferencium was successfully created"
    click_on "Back"
  end

  test "should update Preferencium" do
    visit preferencium_url(@preferencium)
    click_on "Edit this preferencium", match: :first

    check "Recibir notificaciones" if @preferencium.recibir_notificaciones
    fill_in "Unidad monetaria", with: @preferencium.unidad_monetaria
    fill_in "Usuario", with: @preferencium.usuario_id
    click_on "Update Preferencium"

    assert_text "Preferencium was successfully updated"
    click_on "Back"
  end

  test "should destroy Preferencium" do
    visit preferencium_url(@preferencium)
    accept_confirm { click_on "Destroy this preferencium", match: :first }

    assert_text "Preferencium was successfully destroyed"
  end
end
