require "application_system_test_case"

class ModeradorsTest < ApplicationSystemTestCase
  setup do
    @moderador = moderadors(:one)
  end

  test "visiting the index" do
    visit moderadors_url
    assert_selector "h1", text: "Moderadors"
  end

  test "should create moderador" do
    visit moderadors_url
    click_on "New moderador"

    fill_in "Usuario", with: @moderador.usuario_id
    click_on "Create Moderador"

    assert_text "Moderador was successfully created"
    click_on "Back"
  end

  test "should update Moderador" do
    visit moderador_url(@moderador)
    click_on "Edit this moderador", match: :first

    fill_in "Usuario", with: @moderador.usuario_id
    click_on "Update Moderador"

    assert_text "Moderador was successfully updated"
    click_on "Back"
  end

  test "should destroy Moderador" do
    visit moderador_url(@moderador)
    accept_confirm { click_on "Destroy this moderador", match: :first }

    assert_text "Moderador was successfully destroyed"
  end
end
