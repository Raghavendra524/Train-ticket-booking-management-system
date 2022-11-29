require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference("Schedule.count") do
      post schedules_url, params: { schedule: { dst_place_id: @schedule.dst_place_id, reaching_time: @schedule.reaching_time, sch_train_id: @schedule.sch_train_id, schedules_id: @schedule.schedules_id, src_place_id: @schedule.src_place_id, starting_time: @schedule.starting_time, tour_fare: @schedule.tour_fare } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { dst_place_id: @schedule.dst_place_id, reaching_time: @schedule.reaching_time, sch_train_id: @schedule.sch_train_id, schedules_id: @schedule.schedules_id, src_place_id: @schedule.src_place_id, starting_time: @schedule.starting_time, tour_fare: @schedule.tour_fare } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference("Schedule.count", -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
