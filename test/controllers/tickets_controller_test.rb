require "test_helper"

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference("Ticket.count") do
      post tickets_url, params: { ticket: { g_time: @ticket.g_time, no_of_people: @ticket.no_of_people, sch_id: @ticket.sch_id, t_id: @ticket.t_id, total_amount: @ticket.total_amount, u_id: @ticket.u_id } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { g_time: @ticket.g_time, no_of_people: @ticket.no_of_people, sch_id: @ticket.sch_id, t_id: @ticket.t_id, total_amount: @ticket.total_amount, u_id: @ticket.u_id } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference("Ticket.count", -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
