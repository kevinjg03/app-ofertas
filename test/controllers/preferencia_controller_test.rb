require "test_helper"

class PreferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preferencium = preferencia(:one)
  end

  test "should get index" do
    get preferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_preferencium_url
    assert_response :success
  end

  test "should create preferencium" do
    assert_difference("Preferencium.count") do
      post preferencia_url, params: { preferencium: { recibir_notificaciones: @preferencium.recibir_notificaciones, unidad_monetaria: @preferencium.unidad_monetaria, usuario_id: @preferencium.usuario_id } }
    end

    assert_redirected_to preferencium_url(Preferencium.last)
  end

  test "should show preferencium" do
    get preferencium_url(@preferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_preferencium_url(@preferencium)
    assert_response :success
  end

  test "should update preferencium" do
    patch preferencium_url(@preferencium), params: { preferencium: { recibir_notificaciones: @preferencium.recibir_notificaciones, unidad_monetaria: @preferencium.unidad_monetaria, usuario_id: @preferencium.usuario_id } }
    assert_redirected_to preferencium_url(@preferencium)
  end

  test "should destroy preferencium" do
    assert_difference("Preferencium.count", -1) do
      delete preferencium_url(@preferencium)
    end

    assert_redirected_to preferencia_url
  end
end
