class RoundsController < ApplicationController
  before_action :set_competition
  before_action :set_event
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @competitors = Competitor.all
    @allEventSolves = []
    @competitors.each do |competitor|
      @solves = []
      for i in 1..5
        if competitor.solves.exists?(:competitor_id => competitor, solve_number: i)
          @solve = competitor.solves.where(:competitor_id => competitor, solve_number: i).take
          @solves.push(@solve)
        end
      end
      @allEventSolves.push(@solves)
    end
    @numCompetitors = 0
  end

  # GET /rounds/new
  def new
    @round = @event.rounds.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    respond_to do |format|
      if @round.save
        byebug
        format.html { redirect_to competition_event_round_path(@competition, @event, @round), notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to competition_event_round_path(@competition, @event, @round), notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:event_id, :round_number)
    end
end
