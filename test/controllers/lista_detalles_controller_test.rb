require "test_helper"

class ListaDetallesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lista_detalle = lista_detalles(:one)
  end

  test "should get index" do
    get lista_detalles_url
    assert_response :success
  end

  test "should get new" do
    get new_lista_detalle_url
    assert_response :success
  end

  test "should create lista_detalle" do
    assert_difference("ListaDetalle.count") do
      post lista_detalles_url, params: { lista_detalle: { cantidad: @lista_detalle.cantidad, lista_compra_id: @lista_detalle.lista_compra_id, prioridad: @lista_detalle.prioridad, producto_id: @lista_detalle.producto_id } }
    end

    assert_redirected_to lista_detalle_url(ListaDetalle.last)
  end

  test "should show lista_detalle" do
    get lista_detalle_url(@lista_detalle)
    assert_response :success
  end

  test "should get edit" do
    get edit_lista_detalle_url(@lista_detalle)
    assert_response :success
  end

  test "should update lista_detalle" do
    patch lista_detalle_url(@lista_detalle), params: { lista_detalle: { cantidad: @lista_detalle.cantidad, lista_compra_id: @lista_detalle.lista_compra_id, prioridad: @lista_detalle.prioridad, producto_id: @lista_detalle.producto_id } }
    assert_redirected_to lista_detalle_url(@lista_detalle)
  end

  test "should destroy lista_detalle" do
    assert_difference("ListaDetalle.count", -1) do
      delete lista_detalle_url(@lista_detalle)
    end

    assert_redirected_to lista_detalles_url
  end
end
