require "test_helper"

class ListaComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lista_compra = lista_compras(:one)
  end

  test "should get index" do
    get lista_compras_url
    assert_response :success
  end

  test "should get new" do
    get new_lista_compra_url
    assert_response :success
  end

  test "should create lista_compra" do
    assert_difference("ListaCompra.count") do
      post lista_compras_url, params: { lista_compra: { fecha_creacion: @lista_compra.fecha_creacion, nombre: @lista_compra.nombre, usuario_id: @lista_compra.usuario_id } }
    end

    assert_redirected_to lista_compra_url(ListaCompra.last)
  end

  test "should show lista_compra" do
    get lista_compra_url(@lista_compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_lista_compra_url(@lista_compra)
    assert_response :success
  end

  test "should update lista_compra" do
    patch lista_compra_url(@lista_compra), params: { lista_compra: { fecha_creacion: @lista_compra.fecha_creacion, nombre: @lista_compra.nombre, usuario_id: @lista_compra.usuario_id } }
    assert_redirected_to lista_compra_url(@lista_compra)
  end

  test "should destroy lista_compra" do
    assert_difference("ListaCompra.count", -1) do
      delete lista_compra_url(@lista_compra)
    end

    assert_redirected_to lista_compras_url
  end
end
