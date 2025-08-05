require "application_system_test_case"

class NotificacionsTest < ApplicationSystemTestCase
  setup do
    @notificacion = notificacions(:one)
  end

  test "visiting the index" do
    visit notificacions_url
    assert_selector "h1", text: "Notificacions"
  end

  test "should create notificacion" do
    visit notificacions_url
    click_on "New notificacion"

    check "Estado leido" if @notificacion.estado_leido
    fill_in "Fecha envio", with: @notificacion.fecha_envio
    fill_in "Medio", with: @notificacion.medio
    fill_in "Mensaje", with: @notificacion.mensaje
    fill_in "Producto", with: @notificacion.producto_id
    fill_in "Tipo notificacion", with: @notificacion.tipo_notificacion_id
    fill_in "Usuario", with: @notificacion.usuario_id
    click_on "Create Notificacion"

    assert_text "Notificacion was successfully created"
    click_on "Back"
  end

  test "should update Notificacion" do
    visit notificacion_url(@notificacion)
    click_on "Edit this notificacion", match: :first

    check "Estado leido" if @notificacion.estado_leido
    fill_in "Fecha envio", with: @notificacion.fecha_envio.to_s
    fill_in "Medio", with: @notificacion.medio
    fill_in "Mensaje", with: @notificacion.mensaje
    fill_in "Producto", with: @notificacion.producto_id
    fill_in "Tipo notificacion", with: @notificacion.tipo_notificacion_id
    fill_in "Usuario", with: @notificacion.usuario_id
    click_on "Update Notificacion"

    assert_text "Notificacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Notificacion" do
    visit notificacion_url(@notificacion)
    accept_confirm { click_on "Destroy this notificacion", match: :first }

    assert_text "Notificacion was successfully destroyed"
  end
end
