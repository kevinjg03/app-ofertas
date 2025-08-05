require "test_helper"

class ComerciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comercio = comercios(:one)
  end

  test "should get index" do
    get comercios_url
    assert_response :success
  end

  test "should get new" do
    get new_comercio_url
    assert_response :success
  end

  test "should create comercio" do
    assert_difference("Comercio.count") do
      post comercios_url, params: { comercio: { direccion: @comercio.direccion, latitud: @comercio.latitud, longitud: @comercio.longitud, nombre: @comercio.nombre } }
    end

    assert_redirected_to comercio_url(Comercio.last)
  end

  test "should show comercio" do
    get comercio_url(@comercio)
    assert_response :success
  end

  test "should get edit" do
    get edit_comercio_url(@comercio)
    assert_response :success
  end

  test "should update comercio" do
    patch comercio_url(@comercio), params: { comercio: { direccion: @comercio.direccion, latitud: @comercio.latitud, longitud: @comercio.longitud, nombre: @comercio.nombre } }
    assert_redirected_to comercio_url(@comercio)
  end

  test "should destroy comercio" do
    assert_difference("Comercio.count", -1) do
      delete comercio_url(@comercio)
    end

    assert_redirected_to comercios_url
  end
end
