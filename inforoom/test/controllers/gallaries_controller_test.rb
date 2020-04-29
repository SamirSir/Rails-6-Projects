require 'test_helper'

class GallariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallary = gallaries(:one)
  end

  test "should get index" do
    get gallaries_url
    assert_response :success
  end

  test "should get new" do
    get new_gallary_url
    assert_response :success
  end

  test "should create gallary" do
    assert_difference('Gallary.count') do
      post gallaries_url, params: { gallary: { detail: @gallary.detail, name: @gallary.name } }
    end

    assert_redirected_to gallary_url(Gallary.last)
  end

  test "should show gallary" do
    get gallary_url(@gallary)
    assert_response :success
  end

  test "should get edit" do
    get edit_gallary_url(@gallary)
    assert_response :success
  end

  test "should update gallary" do
    patch gallary_url(@gallary), params: { gallary: { detail: @gallary.detail, name: @gallary.name } }
    assert_redirected_to gallary_url(@gallary)
  end

  test "should destroy gallary" do
    assert_difference('Gallary.count', -1) do
      delete gallary_url(@gallary)
    end

    assert_redirected_to gallaries_url
  end
end
