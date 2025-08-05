require "test_helper"

class ModeradorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moderador = moderadors(:one)
  end

  test "should get index" do
    get moderadors_url
    assert_response :success
  end

  test "should get new" do
    get new_moderador_url
    assert_response :success
  end

  test "should create moderador" do
    assert_difference("Moderador.count") do
      post moderadors_url, params: { moderador: { usuario_id: @moderador.usuario_id } }
    end

    assert_redirected_to moderador_url(Moderador.last)
  end

  test "should show moderador" do
    get moderador_url(@moderador)
    assert_response :success
  end

  test "should get edit" do
    get edit_moderador_url(@moderador)
    assert_response :success
  end

  test "should update moderador" do
    patch moderador_url(@moderador), params: { moderador: { usuario_id: @moderador.usuario_id } }
    assert_redirected_to moderador_url(@moderador)
  end

  test "should destroy moderador" do
    assert_difference("Moderador.count", -1) do
      delete moderador_url(@moderador)
    end

    assert_redirected_to moderadors_url
  end
end
