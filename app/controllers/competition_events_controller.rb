class CompetitionEventsController < ApplicationController
  before_action :set_competition
  before_action :set_competition_event, only: [:show, :edit, :update, :destroy]
  before_action :set_competitors, only: [:show]

  # GET /competition_events
  # GET /competition_events.json
  def index
    @competition_events = competition_event.all
  end

  # GET /competition_events/1
  # GET /competition_events/1.json
  def show
    @allcompetition_eventSolves = []
    @competitors.each do |competitor|
      @solves = []
      for i in 1..5
        if competitor.solves.exists?(:competitor_id => competitor, solve_number: i)
          @solve = competitor.solves.where(:competitor_id => competitor, solve_number: i).take
          @solves.push(@solve)
        end
      end
      @allcompetition_eventSolves.push(@solves)
    end
    @numCompetitors = 0
end

  # GET /competition_events/new
  def new
    @competition_event = @competition.competition_events.new
  end

  # GET /competition_events/1/edit
  def edit
  end

  # POST /competition_events
  # POST /competition_events.json
  def create
    @competition_event = @competition.competition_events.new(competition_event_params)

    respond_to do |format|
      if @competition_event.save
        format.html { redirect_to competition_competition_event_path(@competition, @competition_event), notice: 'competition_event was successfully created.' }
        format.json { render :show, status: :created, location: @competition_event }
      else
        format.html { render :new }
        format.json { render json: @competition_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competition_events/1
  # PATCH/PUT /competition_events/1.json
  def update
    respond_to do |format|
      if @competition_event.update(competition_event_params)
        format.html { redirect_to competition_competition_event_path(@competition, @competition_event), notice: 'competition_event was successfully updated.' }
        format.json { render :show, status: :ok, location: competition_competition_event_path(@competition, @competition_event) }
      else
        format.html { render :edit }
        format.json { render json: @competition_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competition_events/1
  # DELETE /competition_events/1.json
  def destroy
    @competition_event.destroy
    respond_to do |format|
      format.html { redirect_to competition_competition_events_path(@competition), notice: 'competition_event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition_event
      @competition_event = @competition.competition_events.find(params[:id])
    end

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_competitors
      @competitors = Competitor.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_event_params
      params.require(:competition_event).permit(:name, :competition_id, :num_competitors)
    end
end
