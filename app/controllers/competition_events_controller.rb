class CompetitionEventsController < ApplicationController
  before_action :set_competition
  before_action :set_competition_event, only: [:show, :edit, :update, :destroy]
  before_action :set_competition_events, only: [:new]
  before_action :set_competitors, only: [:show]

  # GET /competition_events
  # GET /competition_events.json
  def index
    @competition_events = CompetitionEvent.all
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
    @meta_events = ["e_3x3", "e_2x2", "e_skewb"]

    # for each event that already has a record created, remove it from the meta_events array.
    @competition.competition_events.each do |event|
      @event_name_plus_event_tag = "e_" + "#{event.name}"

      @meta_events.delete(@event_name_plus_event_tag)
    end
    @event_count = 0
  end

  # GET /competition_events/1/edit
  def edit
  end

  # POST /competition_events
  # POST /competition_events.json
  def create
    @meta_events = ["e_3x3", "e_2x2", "e_skewb"]
    @errors = []

    @meta_events.each do |event|
      if params["competition_event"][event] == "1"
        @competition_event = @competition.competition_events.new(competition_event_params)
        @competition_event.name = event[2..-1]
        @competition_event.num_competitors = 0

        if @competition_event.save
        else
          @errors.push(@competition_event.errors)
        end
      end
    end

redirect_to competition_path(@competition)





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

    def set_competition_events
      @competition_events = @competition.competition_events.all
    end

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end

    def set_competitors
      @competitors = Competitor.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_event_params
      params.require(:competition_event).permit(:name, :competition_id, :num_competitors, :e_3x3, :e_2x2, :e_skewb)
    end
end
