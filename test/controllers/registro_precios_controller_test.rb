require "test_helper"

class RegistroPreciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_precio = registro_precios(:one)
  end

  test "should get index" do
    get registro_precios_url
    assert_response :success
  end

  test "should get new" do
    get new_registro_precio_url
    assert_response :success
  end

  test "should create registro_precio" do
    assert_difference("RegistroPrecio.count") do
      post registro_precios_url, params: { registro_precio: { comercio_id: @registro_precio.comercio_id, es_atipico: @registro_precio.es_atipico, estado_registro_id: @registro_precio.estado_registro_id, fecha_registro: @registro_precio.fecha_registro, foto_ticket_url: @registro_precio.foto_ticket_url, latitud: @registro_precio.latitud, longitud: @registro_precio.longitud, moneda: @registro_precio.moneda, precio: @registro_precio.precio, producto_id: @registro_precio.producto_id, usuario_id: @registro_precio.usuario_id } }
    end

    assert_redirected_to registro_precio_url(RegistroPrecio.last)
  end

  test "should show registro_precio" do
    get registro_precio_url(@registro_precio)
    assert_response :success
  end

  test "should get edit" do
    get edit_registro_precio_url(@registro_precio)
    assert_response :success
  end

  test "should update registro_precio" do
    patch registro_precio_url(@registro_precio), params: { registro_precio: { comercio_id: @registro_precio.comercio_id, es_atipico: @registro_precio.es_atipico, estado_registro_id: @registro_precio.estado_registro_id, fecha_registro: @registro_precio.fecha_registro, foto_ticket_url: @registro_precio.foto_ticket_url, latitud: @registro_precio.latitud, longitud: @registro_precio.longitud, moneda: @registro_precio.moneda, precio: @registro_precio.precio, producto_id: @registro_precio.producto_id, usuario_id: @registro_precio.usuario_id } }
    assert_redirected_to registro_precio_url(@registro_precio)
  end

  test "should destroy registro_precio" do
    assert_difference("RegistroPrecio.count", -1) do
      delete registro_precio_url(@registro_precio)
    end

    assert_redirected_to registro_precios_url
  end
end
