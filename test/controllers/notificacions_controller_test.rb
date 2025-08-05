require "test_helper"

class NotificacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notificacion = notificacions(:one)
  end

  test "should get index" do
    get notificacions_url
    assert_response :success
  end

  test "should get new" do
    get new_notificacion_url
    assert_response :success
  end

  test "should create notificacion" do
    assert_difference("Notificacion.count") do
      post notificacions_url, params: { notificacion: { estado_leido: @notificacion.estado_leido, fecha_envio: @notificacion.fecha_envio, medio: @notificacion.medio, mensaje: @notificacion.mensaje, producto_id: @notificacion.producto_id, tipo_notificacion_id: @notificacion.tipo_notificacion_id, usuario_id: @notificacion.usuario_id } }
    end

    assert_redirected_to notificacion_url(Notificacion.last)
  end

  test "should show notificacion" do
    get notificacion_url(@notificacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_notificacion_url(@notificacion)
    assert_response :success
  end

  test "should update notificacion" do
    patch notificacion_url(@notificacion), params: { notificacion: { estado_leido: @notificacion.estado_leido, fecha_envio: @notificacion.fecha_envio, medio: @notificacion.medio, mensaje: @notificacion.mensaje, producto_id: @notificacion.producto_id, tipo_notificacion_id: @notificacion.tipo_notificacion_id, usuario_id: @notificacion.usuario_id } }
    assert_redirected_to notificacion_url(@notificacion)
  end

  test "should destroy notificacion" do
    assert_difference("Notificacion.count", -1) do
      delete notificacion_url(@notificacion)
    end

    assert_redirected_to notificacions_url
  end
end
