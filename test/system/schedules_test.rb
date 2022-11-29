require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "should create schedule" do
    visit schedules_url
    click_on "New schedule"

    fill_in "Dst place", with: @schedule.dst_place_id
    fill_in "Reaching time", with: @schedule.reaching_time
    fill_in "Sch train", with: @schedule.sch_train_id
    fill_in "Schedules", with: @schedule.schedules_id
    fill_in "Src place", with: @schedule.src_place_id
    fill_in "Starting time", with: @schedule.starting_time
    fill_in "Tour fare", with: @schedule.tour_fare
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "should update Schedule" do
    visit schedule_url(@schedule)
    click_on "Edit this schedule", match: :first

    fill_in "Dst place", with: @schedule.dst_place_id
    fill_in "Reaching time", with: @schedule.reaching_time
    fill_in "Sch train", with: @schedule.sch_train_id
    fill_in "Schedules", with: @schedule.schedules_id
    fill_in "Src place", with: @schedule.src_place_id
    fill_in "Starting time", with: @schedule.starting_time
    fill_in "Tour fare", with: @schedule.tour_fare
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Schedule" do
    visit schedule_url(@schedule)
    click_on "Destroy this schedule", match: :first

    assert_text "Schedule was successfully destroyed"
  end
end