require "test_helper"

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Categoria = categoria(:one)
  end

  test "should get index" do
    get categoria_url
    assert_response :success
  end

  test "should get new" do
    get new_Categoria_url
    assert_response :success
  end

  test "should create Categoria" do
    assert_difference("Categoria.count") do
      post categoria_url, params: { Categoria: { nombre: @Categoria.nombre } }
    end

    assert_redirected_to Categoria_url(Categoria.last)
  end

  test "should show Categoria" do
    get Categoria_url(@Categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_Categoria_url(@Categoria)
    assert_response :success
  end

  test "should update Categoria" do
    patch Categoria_url(@Categoria), params: { Categoria: { nombre: @Categoria.nombre } }
    assert_redirected_to Categoria_url(@Categoria)
  end

  test "should destroy Categoria" do
    assert_difference("Categoria.count", -1) do
      delete Categoria_url(@Categoria)
    end

    assert_redirected_to categoria_url
  end
end
