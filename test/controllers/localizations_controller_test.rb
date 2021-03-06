require 'test_helper'

class LocalizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @localization = localizations(:one)
  end

  test "should get index" do
    get localizations_url
    assert_response :success
  end

  test "should get new" do
    get new_localization_url
    assert_response :success
  end

  test "should create localization" do
    assert_difference('Localization.count') do
      post localizations_url, params: { localization: { data: @localization.data, page_id: @localization.page_id } }
    end

    assert_redirected_to localization_url(Localization.last)
  end

  test "should show localization" do
    get localization_url(@localization)
    assert_response :success
  end

  test "should get edit" do
    get edit_localization_url(@localization)
    assert_response :success
  end

  test "should update localization" do
    patch localization_url(@localization), params: { localization: { data: @localization.data, page_id: @localization.page_id } }
    assert_redirected_to localization_url(@localization)
  end

  test "should destroy localization" do
    assert_difference('Localization.count', -1) do
      delete localization_url(@localization)
    end

    assert_redirected_to localizations_url
  end
end
