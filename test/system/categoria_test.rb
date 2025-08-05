require "application_system_test_case"

class CategoriaTest < ApplicationSystemTestCase
  setup do
    @Categoria = categoria(:one)
  end

  test "visiting the index" do
    visit categoria_url
    assert_selector "h1", text: "Categoria"
  end

  test "should create Categoria" do
    visit categoria_url
    click_on "New Categoria"

    fill_in "Nombre", with: @Categoria.nombre
    click_on "Create Categoria"

    assert_text "Categoria was successfully created"
    click_on "Back"
  end

  test "should update Categoria" do
    visit Categoria_url(@Categoria)
    click_on "Edit this Categoria", match: :first

    fill_in "Nombre", with: @Categoria.nombre
    click_on "Update Categoria"

    assert_text "Categoria was successfully updated"
    click_on "Back"
  end

  test "should destroy Categoria" do
    visit Categoria_url(@Categoria)
    accept_confirm { click_on "Destroy this Categoria", match: :first }

    assert_text "Categoria was successfully destroyed"
  end
end
