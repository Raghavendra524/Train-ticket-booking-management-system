require 'twilio-ruby'

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ] 

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end
  
  def passenger_log
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    
    @s_id = params[:data].to_i
    @sobject = Schedule.find(@s_id)
    @t_id = @sobject.train_id
    @t_fair = @sobject.tour_fare
    @fortrain = Train.find(@t_id)
    @forschedule = Schedule.find(@s_id)
    @startplace = Place.find(@forschedule.src_place_id)
    @endplace = Place.find(@forschedule.dst_place_id) 
    
    @ticket = current_user.tickets.build
  end
  
  # GET /tickets/1/edit
  def edit
  end
  
  # POST /tickets or /tickets.json
  def create
    # @ticket = Ticket.new(ticket_params)
    @forschedule = Schedule.find(ticket_params[:schedule_id])
    @fortrain = Train.find(ticket_params[:train_id])
    @startplace = Place.find(@forschedule.src_place_id)
    @endplace = Place.find(@forschedule.dst_place_id) 
    @forschedule.pass_count = @forschedule.pass_count + ticket_params[:no_of_people].to_i
    
    @ticket = current_user.tickets.build(ticket_params)
    @ticket.total_amount = ticket_params[:no_of_people].to_i * @forschedule.tour_fare.to_i
    @paymentdata = {:type_of_pay => "online", :status => "paid",:user_id => current_user.id,:amount => @ticket.total_amount}
    @paymentobj = current_user.payments.build(@paymentdata)
    @paymentobj.save

    
    respond_to do |format|
      if @ticket.save and @forschedule.pass_count <= @fortrain.train_capacity
        
        @paymentobj.ticket_id = @ticket.id
        @paymentobj.save
        @ticket.payment_id = @paymentobj.id
        @ticket.save
        @forschedule.save
        
        format.html { redirect_to root_url, notice: "Ticket was successfully created." }
                

        # account_sid = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        # auth_token = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        # client = Twilio::REST::Client.new(account_sid, auth_token)

        # from = '+00000000000' # Your Twilio number
        # to = '+00000000000' # Your mobile phone number

        # client.messages.create(
        # from: from,
        # to: to,
        # body: "Your ticket for Train => " + @fortrain.train_name + " from " + @startplace.name + " to " + @endplace.name + " for " + ticket_params[:no_of_people] + " people is confirmed."
        # )

        format.json { render :show, status: :created, location: @ticket }
      else
        @forschedule.pass_count = @forschedule.pass_count - ticket_params[:no_of_people].to_i
        @forschedule.save
        # format.html { render :new, status: :unprocessable_entity }
        format.html { redirect_to schedules_url, notice: "Ticket booking cancelled because of tickets are not available. Try some other train." }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @count = Schedule.find(@ticket.schedule_id)
    @fortrain = Train.find(@ticket.train_id)
    @count.pass_count = @count.pass_count - @ticket.no_of_people
    @count.save
    
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:no_of_people, :total_amount, :user_id,:train_id,:schedule_id,:payment_id,:data)
    end
end
